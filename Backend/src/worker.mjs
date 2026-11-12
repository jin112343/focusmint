import {dispatchEmail,sendNotificationTest} from './email.mjs';
import {SupportError,supportStatus,acknowledgeSupport} from './support.mjs';
const encoder = new TextEncoder();
const ACK = 'support.received';
const JSON_HEADERS = { 'content-type': 'application/json; charset=utf-8', 'cache-control': 'no-store', 'x-content-type-options': 'nosniff' };
class APIError extends Error { constructor(status, code) { super(code); this.status = status; } }
const fail = (status, code) => { throw new APIError(status, code); };
const json = (value, status=200, headers={}) => new Response(JSON.stringify(value), {status, headers:{...JSON_HEADERS,...headers}});
const uuid = value => typeof value === 'string' && /^[0-9a-f]{8}-[0-9a-f-]{27}$/i.test(value);
const now = () => Date.now();
const day = () => new Date().toISOString().slice(0,10);
const hex = bytes => [...new Uint8Array(bytes)].map(x=>x.toString(16).padStart(2,'0')).join('');
export const digest = async text => hex(await crypto.subtle.digest('SHA-256',encoder.encode(text)));
const randomToken = () => hex(crypto.getRandomValues(new Uint8Array(32)));
const equal = (a,b) => { let d=a.length^b.length; for(let i=0;i<Math.max(a.length,b.length);i++) d|=(a.charCodeAt(i)||0)^(b.charCodeAt(i)||0); return d===0; };
async function hmac(secret, text) {
 const key=await crypto.subtle.importKey('raw',encoder.encode(secret),{name:'HMAC',hash:'SHA-256'},false,['sign']);
 return hex(await crypto.subtle.sign('HMAC',key,encoder.encode(text)));
}
async function body(request) {
 if(Number(request.headers.get('content-length')||0)>350000) fail(413,'too_large');
 const reader=request.body?.getReader();if(!reader)fail(400,'invalid_json');
 const chunks=[];let length=0;
 try {while(true){const {value,done}=await reader.read();if(done)break;length+=value.byteLength;
  if(length>350000){await reader.cancel();fail(413,'too_large');}chunks.push(value);
 }} finally {reader.releaseLock();}
 const bytes=new Uint8Array(length);let offset=0;for(const chunk of chunks){bytes.set(chunk,offset);offset+=chunk.length;}
 let data;try {data=JSON.parse(new TextDecoder('utf-8',{fatal:true}).decode(bytes));}catch{fail(400,'invalid_json');}
 if(!data||typeof data!=='object'||Array.isArray(data))fail(400,'invalid_json');return data;
}
const stmt = (env,sql,...args) => env.DB.prepare(sql).bind(...args);
async function rate(env,key,maximum,seconds) {
 const result=await stmt(env,'INSERT INTO limits(key,count,expires_at) VALUES(?,1,?) ON CONFLICT(key) DO UPDATE SET count=CASE WHEN expires_at<? THEN 1 ELSE count+1 END,expires_at=CASE WHEN expires_at<? THEN excluded.expires_at ELSE expires_at END RETURNING count',key,now()+seconds*1000,now(),now()).first();
 if(result.count>maximum) fail(429,'rate_limited');
}
async function networkLimit(request,env,purpose,maximum,seconds) {
 const bucket=Math.floor(now()/(seconds*1000));
 const key=await hmac(env.SESSION_SECRET,purpose+':'+bucket+':'+(request.headers.get('CF-Connecting-IP')||'local'));
 await rate(env,key,maximum,seconds);
}
async function identity(request,env) {
 const bearer=request.headers.get('Authorization')||'';
 if(!/^Bearer [a-f0-9]{64}$/.test(bearer)) fail(401,'unauthorized');
 const user=await stmt(env,'SELECT * FROM identities WHERE token_hash=?',await digest(bearer.slice(7))).first();
 if(!user) fail(401,'unauthorized');
 if(user.updated_at<now()-86400000)await stmt(env,'UPDATE identities SET updated_at=? WHERE id=?',now(),user.id).run();
 return user;
}
async function admin(request,env) {
 const cookie=(request.headers.get('cookie')||'').split(';').map(x=>x.trim()).find(x=>x.startsWith('focusmint_admin='))?.slice(16);
 if(!cookie) return false;
 const [expires,signature]=cookie.split('.');
 return /^\d+$/.test(expires) && Number(expires)>now() && Number(expires)<now()+43200001 && equal(signature||'',await hmac(env.SESSION_SECRET,expires));
}
function csrf(request) {
 if(request.headers.get('origin')!==new URL(request.url).origin || request.headers.get('x-focusmint-admin')!=='1') fail(403,'origin');
}
export function stripJPEG(base64) {
 if(typeof base64!=='string'||base64.length>333336) fail(400,'invalid_image');
 let bytes; try { bytes=Uint8Array.from(atob(base64),x=>x.charCodeAt(0)); } catch { fail(400,'invalid_image'); }
 if(bytes.length<4||bytes.length>250000||bytes[0]!==255||bytes[1]!==216||bytes[bytes.length-2]!==255||bytes[bytes.length-1]!==217) fail(400,'invalid_image');
 const parts=[bytes.slice(0,2)]; let p=2;
 while(p<bytes.length) {
  if(bytes[p]!==255) fail(400,'invalid_image');
  const marker=bytes[p+1];
  if(marker===218||marker===217) {parts.push(bytes.slice(p));break;}
  const length=(bytes[p+2]<<8)|bytes[p+3]; if(length<2||p+length+2>bytes.length) fail(400,'invalid_image');
  if(marker!==225&&marker!==237&&marker!==254) parts.push(bytes.slice(p,p+length+2));
  p+=length+2;
 }
 const output=new Uint8Array(parts.reduce((n,a)=>n+a.length,0)); let offset=0;
 for(const part of parts) {output.set(part,offset);offset+=part.length;} return output;
}
async function messages(env,owner) {
 const records=await stmt(env,'SELECT * FROM (SELECT id,author,body,image_key,created_at FROM messages WHERE owner=? ORDER BY created_at DESC,id DESC LIMIT 300) ORDER BY created_at,id',owner).all();
 const status=await supportStatus(env,owner);
 return {messages:records.results.map(({image_key,created_at,...item})=>({...item,createdAt:new Date(created_at).toISOString(),hasImage:!!image_key})),...status,remaining:status.remainingToday};
}
async function sendMessage(request,env,user,asAdmin=false,ctx) {
 const data=await body(request); if(!uuid(data.id)) fail(400,'invalid_id');
 const existing=await stmt(env,"SELECT owner,author FROM messages WHERE id=? UNION ALL SELECT owner,'developer' AS author FROM support_replies WHERE message_id=? LIMIT 1",data.id,data.id).first();
 if(existing) {if(existing.owner!==user.id||existing.author!==(asAdmin?'developer':'user')) fail(409,'id_conflict');return json(await messages(env,user.id));}
 const text=typeof data.body==='string'?data.body.trim():'';
 if(text.length>2000||(!text&&!data.image)) fail(400,'invalid_message');
 let imageKey=null;
 if(data.image) {const bytes=stripJPEG(data.image);imageKey=user.id+'/'+crypto.randomUUID()+'.jpg';await env.IMAGES.put(imageKey,bytes,{httpMetadata:{contentType:'image/jpeg'}});}
 const time=now();
 try {
  const operations=[stmt(env,'INSERT INTO messages(id,owner,author,body,image_key,day,created_at) VALUES(?,?,?,?,?,?,?)',data.id,user.id,asAdmin?'developer':'user',text,imageKey,day(),time),stmt(env,'UPDATE identities SET updated_at=? WHERE id=?',time,user.id)];
  if(!asAdmin) operations.push(stmt(env,"INSERT INTO messages(id,owner,author,body,created_at,is_read) VALUES(?,?,'automatic',?,?,1)",crypto.randomUUID(),user.id,ACK,time+1));
  await env.DB.batch(operations);
  if(imageKey){const stored=await stmt(env,'SELECT image_key FROM messages WHERE id=?',data.id).first();if(stored?.image_key!==imageKey)await env.IMAGES.delete(imageKey);}
 } catch(error) {
  if(imageKey) await env.IMAGES.delete(imageKey);
  if(String(error).includes('daily_quota')) fail(429,'daily_quota');
  if(String(error).includes('reply_id_conflict')) fail(409,'id_conflict');
  const retry=await stmt(env,"SELECT owner,author FROM messages WHERE id=? UNION ALL SELECT owner,'developer' AS author FROM support_replies WHERE message_id=? LIMIT 1",data.id,data.id).first();
  if(retry&&(retry.owner!==user.id||retry.author!==(asAdmin?'developer':'user')))fail(409,'id_conflict');
  if(!retry)throw error;
 }
 if(!asAdmin&&ctx?.waitUntil)ctx.waitUntil(dispatchEmail(env,{maximum:3}));
 return json(await messages(env,user.id));
}
async function removeMessages(env,owner) {
 const images=await stmt(env,'SELECT image_key FROM messages WHERE owner=? AND image_key IS NOT NULL',owner).all();
 for(const item of images.results) await env.IMAGES.delete(item.image_key);
 await stmt(env,'DELETE FROM messages WHERE owner=?',owner).run();
}
async function route(request,env,ctx) {
 const url=new URL(request.url), path=url.pathname, method=request.method;
 if(path==='/api/health') return json({ok:true,service:'focusmint-support',schema:1});
 if(path==='/api/identities'&&method==='POST') {
  await networkLimit(request,env,'identity',20,3600);
  const data=await body(request);if(!['ios','android'].includes(data.platform)) fail(400,'invalid_platform');
  const id=crypto.randomUUID(),token=randomToken(),time=now();
  await stmt(env,'INSERT INTO identities VALUES(?,?,?,?,?,?,?)',id,await digest(token),data.platform,String(data.language||'en').slice(0,20),String(data.version||'1.0').slice(0,20),time,time).run();
  return json({id,token},201);
 }
 if(path==='/api/admin/login'&&method==='POST') {
  csrf(request);await networkLimit(request,env,'login',5,900);
  const data=await body(request);
  if(typeof data.password!=='string'||data.password.length>200||!env.ADMIN_PASSWORD_HASH||!equal(await digest(data.password),env.ADMIN_PASSWORD_HASH)) fail(401,'unauthorized');
  const expires=String(now()+43200000),signature=await hmac(env.SESSION_SECRET,expires);
  return json({ok:true},200,{'set-cookie':`focusmint_admin=${expires}.${signature}; Path=/; Secure; HttpOnly; SameSite=Strict; Max-Age=43200`});
 }
 if(path.startsWith('/api/admin/')) {
  if(!await admin(request,env)) fail(401,'unauthorized');
  if(method!=='GET') csrf(request);
  if(path==='/api/admin/logout') return json({ok:true},200,{'set-cookie':'focusmint_admin=; Path=/; Secure; HttpOnly; SameSite=Strict; Max-Age=0'});
  if(path==='/api/admin/notification-test'&&method==='POST'){try{return json({ok:true,...await sendNotificationTest(env)});}catch(error){return json({error:typeof error.code==='string'?error.code:'email_unavailable'},503);}}
  if(path==='/api/admin/session') return json({ok:true});
  if(path==='/api/admin/conversations') {
   const list=await env.DB.prepare("SELECT i.id,i.platform,i.language,i.version,i.updated_at,(SELECT body FROM messages WHERE owner=i.id ORDER BY created_at DESC LIMIT 1) AS preview,(SELECT COUNT(*) FROM messages WHERE owner=i.id AND author='user' AND is_read=0) AS unread FROM identities i WHERE EXISTS(SELECT 1 FROM messages WHERE owner=i.id) ORDER BY i.updated_at DESC LIMIT 100").all();return json({rows:list.results});
  }
  const conversation=path.match(/^\/api\/admin\/conversations\/([a-f0-9-]+)$/);
  if(conversation) {const user=await stmt(env,'SELECT * FROM identities WHERE id=?',conversation[1]).first();if(!user) fail(404,'not_found');if(method==='POST') return sendMessage(request,env,user,true,ctx);await stmt(env,"UPDATE messages SET is_read=1 WHERE owner=? AND author='user'",user.id).run();return json(await messages(env,user.id));}
  fail(404,'not_found');
 }
 if(path.startsWith('/api/attachments/')) {
  const id=path.split('/').pop(),image=await stmt(env,'SELECT owner,image_key FROM messages WHERE id=?',id).first();if(!image?.image_key) fail(404,'not_found');
  if(!await admin(request,env)) {const user=await identity(request,env);if(image.owner!==user.id) fail(404,'not_found');}
  const object=await env.IMAGES.get(image.image_key);if(!object) fail(404,'not_found');return new Response(object.body,{headers:{'content-type':'image/jpeg','cache-control':'private,no-store','x-content-type-options':'nosniff'}});
 }
 if(path.startsWith('/api/')) {
  const user=await identity(request,env);
  await rate(env,'user:'+user.id,120,60);
  if(path==='/api/support/status'&&method==='GET')return json(await supportStatus(env,user.id));
  if(path==='/api/support/read'&&method==='POST')return json(await acknowledgeSupport(env,user.id,await body(request)));
  if(path==='/api/messages') {if(method==='POST') return sendMessage(request,env,user,false,ctx);if(method==='DELETE') await removeMessages(env,user.id);else if(method!=='GET')fail(405,'method');return json(await messages(env,user.id));}
  fail(404,'not_found');
 }
 if(path==='/support-privacy'){const response=await env.ASSETS.fetch(new Request(new URL('/privacy',url),request));const headers=new Headers(response.headers);headers.set('content-security-policy',"default-src 'none'; style-src 'self'; base-uri 'none'; frame-ancestors 'none'");headers.set('x-content-type-options','nosniff');return new Response(response.body,{status:response.status,headers});}
 if(path==='/'||path==='/admin'||path==='/admin/'||path==='/admin.js'||path==='/style.css'||path==='/policy.css') {
  const target=new URL(path==='/'||path==='/admin'||path==='/admin/'?'/':path,url);const response=await env.ASSETS.fetch(new Request(target,request));
  const headers=new Headers(response.headers);headers.set('content-security-policy',"default-src 'self'; script-src 'self'; style-src 'self'; img-src 'self' blob:; connect-src 'self'; frame-ancestors 'none'; base-uri 'none'; form-action 'self'");headers.set('x-content-type-options','nosniff');return new Response(response.body,{status:response.status,headers});
 }
 return new Response('Not found',{status:404});
}
export default {
 async fetch(request,env,ctx) {try {return await route(request,env,ctx);}catch(error){const known=error instanceof APIError||error instanceof SupportError;return json({error:known?error.message:'unavailable'},known?error.status:503);}},
 async scheduled(event,env) {
  if(event.cron==='* * * * *'){await dispatchEmail(env);return;}
  const expired=await stmt(env,'SELECT id FROM identities WHERE updated_at<?',now()-90*86400000).all();
  for(const user of expired.results) {await removeMessages(env,user.id);await stmt(env,'DELETE FROM identities WHERE id=?',user.id).run();}
  const inactive=await stmt(env,'SELECT owner FROM messages GROUP BY owner HAVING MAX(created_at)<?',now()-90*86400000).all();
  for(const conversation of inactive.results)await removeMessages(env,conversation.owner);
  await stmt(env,'DELETE FROM limits WHERE expires_at<?',now()).run();
  await stmt(env,'DELETE FROM quotas WHERE day<?',new Date(now()-7*86400000).toISOString().slice(0,10)).run();
 }
};
