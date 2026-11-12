import {test} from 'node:test';
import assert from 'node:assert/strict';
import worker,{digest} from '../src/worker.mjs';
import {environment,call,user,adminCall} from './helpers.mjs';
const status=async(e,u)=>(await call(e,'/api/support/status','GET',null,u.token)).json();
const send=(e,u,id=crypto.randomUUID(),body='Question')=>call(e,'/api/messages','POST',{id,body},u.token);
const reply=(e,u,id=crypto.randomUUID())=>adminCall(e,u.id,{id,body:'Developer reply'});
test('quota survives delete, resets on genuine replies, and retries are idempotent',async()=>{
 const e=environment(),u=await user(e),v=await user(e),id=crypto.randomUUID();
 assert.equal((await send(e,u,id)).status,200);assert.equal((await send(e,u,id)).status,200);assert.equal((await status(e,u)).remainingToday,2);assert.equal((await send(e,v,id)).status,409);
 await send(e,u);await send(e,u);assert.equal((await send(e,u)).status,429);
 await call(e,'/api/messages','DELETE',null,u.token);assert.equal((await status(e,u)).remainingToday,0);
 const rid=crypto.randomUUID();await reply(e,u,rid);assert.equal((await status(e,u)).remainingToday,3);
 await send(e,u);await reply(e,u,rid);assert.equal((await status(e,u)).remainingToday,2);
 await call(e,'/api/messages','DELETE',null,u.token);await reply(e,u,rid);assert.equal((await status(e,u)).remainingToday,2);assert.equal((await reply(e,v,rid)).status,409);
});
test('unread is owned and monotonic; fetching history never marks it read',async()=>{
 const e=environment(),u=await user(e),v=await user(e),a=crypto.randomUUID(),b=crypto.randomUUID();await reply(e,u,a);await reply(e,u,b);
 const initial=await status(e,u);assert.equal(initial.unreadCount,2);await call(e,'/api/messages','GET',null,u.token);assert.equal((await status(e,u)).unreadCount,2);
 assert.equal((await call(e,'/api/support/read','POST',{throughMessageId:b},v.token)).status,404);
 const first=await(await call(e,'/api/support/read','POST',{throughMessageId:a},u.token)).json();assert.equal(first.unreadCount,1);assert.ok(first.revision>initial.revision);
 const repeat=await(await call(e,'/api/support/read','POST',{throughMessageId:a},u.token)).json();assert.equal(repeat.revision,first.revision);
 await call(e,'/api/support/read','POST',{throughMessageId:b},u.token);assert.equal((await status(e,u)).unreadCount,0);
});
test('attachments are private, EXIF stripped, and deleted with history',async()=>{
 const e=environment(),u=await user(e),v=await user(e),id=crypto.randomUUID(),jpeg=Buffer.from([255,216,255,225,0,6,71,80,83,0,255,218,0,2,255,217]);
 assert.equal((await call(e,'/api/messages','POST',{id,body:'',image:jpeg.toString('base64')},u.token)).status,200);
 assert.equal((await call(e,'/api/attachments/'+id,'GET',null,v.token)).status,404);assert.equal((await call(e,'/api/attachments/'+id)).status,401);
 const image=await call(e,'/api/attachments/'+id,'GET',null,u.token);assert.equal(image.status,200);assert.equal(image.headers.get('cache-control'),'private,no-store');assert.ok(!(await image.text()).includes('GPS'));
 await call(e,'/api/messages','DELETE',null,u.token);assert.equal(e.imageObjects.size,0);
});
test('invalid, oversized and unauthorized writes do not consume quota',async()=>{
 const e=environment(),u=await user(e);assert.equal((await send(e,u,crypto.randomUUID(),'')).status,400);assert.equal((await send(e,u,crypto.randomUUID(),'x'.repeat(2001))).status,400);assert.equal((await send(e,u,'bad')).status,400);
 assert.equal((await call(e,'/api/messages','POST',{id:crypto.randomUUID(),body:'x'})).status,401);assert.equal((await call(e,'/api/messages','PUT',{},u.token)).status,405);assert.equal((await status(e,u)).remainingToday,3);
});
test('quota day rolls over at server UTC midnight',async()=>{
 const e=environment(),u=await user(e);e.database.prepare('INSERT INTO quotas VALUES(?,?,3)').run(u.id,'2000-01-01');assert.equal((await status(e,u)).remainingToday,3);await send(e,u);assert.equal((await status(e,u)).remainingToday,2);
});
test('admin login and reply require authentication and same origin',async()=>{
 const e=environment(),u=await user(e);e.ADMIN_PASSWORD_HASH=await digest('test-password');
 const req=(origin,password='test-password')=>new Request('https://focusmint.test/api/admin/login',{method:'POST',headers:{origin,'x-focusmint-admin':'1','content-type':'application/json'},body:JSON.stringify({password})});
 assert.equal((await worker.fetch(req('https://other.test'),e)).status,403);assert.equal((await worker.fetch(req('https://focusmint.test','wrong'),e)).status,401);
 const response=await worker.fetch(req('https://focusmint.test'),e);assert.equal(response.status,200);assert.match(response.headers.get('set-cookie'),/HttpOnly; SameSite=Strict/);
 assert.equal((await call(e,'/api/admin/conversations/'+u.id,'POST',{id:crypto.randomUUID(),body:'reply'})).status,401);
});
test('retention removes inactive histories and identities',async()=>{
 const e=environment(),u=await user(e);await send(e,u);await reply(e,u);e.database.prepare('UPDATE identities SET updated_at=0').run();await worker.scheduled({cron:'17 3 * * *'},e);
 assert.equal(e.database.prepare('SELECT COUNT(*) AS n FROM messages').get().n,0);assert.equal((await call(e,'/api/messages','GET',null,u.token)).status,401);
});

test('admin and privacy serve canonical asset paths without redirect loops',async()=>{
 const e=environment();e.ASSETS={async fetch(request){const path=new URL(request.url).pathname;return path==='/'||path==='/privacy'?new Response('<html>FocusMint</html>',{headers:{'content-type':'text/html'}}):Response.redirect('https://focusmint.test/',308);}};
 for(const path of ['/','/admin','/support-privacy']){const r=await call(e,path);assert.equal(r.status,200);assert.match(await r.text(),/FocusMint/);assert.ok(r.headers.get('content-security-policy').includes("frame-ancestors 'none'"));}
});
