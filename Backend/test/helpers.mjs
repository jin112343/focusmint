import {DatabaseSync} from 'node:sqlite';
import {readFileSync,readdirSync} from 'node:fs';
import assert from 'node:assert/strict';
import worker from '../src/worker.mjs';
export function environment({migrate=true}={}){
 const database=new DatabaseSync(':memory:');
 const migrations=new URL('../migrations/',import.meta.url);
 for(const migration of readdirSync(migrations).filter(name=>name.endsWith('.sql')).sort()){
  if(!migrate&&migration!=='0001_support.sql')continue;
  database.exec(readFileSync(new URL(migration,migrations),'utf8'));
 }
 const binding={prepare(sql){
  const make=args=>({bind(...values){return make(values);},async first(){return database.prepare(sql).get(...args)||null;},async all(){return{results:database.prepare(sql).all(...args)};},async run(){return database.prepare(sql).run(...args);},sql,args});
  return make([]);
 },async batch(statements){database.exec('BEGIN');try{const result=statements.map(s=>database.prepare(s.sql).run(...s.args));database.exec('COMMIT');return result;}catch(error){database.exec('ROLLBACK');throw error;}}};
 const images=new Map();
 return {database,imageObjects:images,DB:binding,IMAGES:{async put(k,v){images.set(k,v);},async delete(k){images.delete(k);},async get(k){return images.has(k)?{body:images.get(k)}:null;}},SESSION_SECRET:'test-only-secret-not-a-production-secret'};
}
export const call=(env,path,method='GET',data,token,ctx)=>worker.fetch(new Request('https://focusmint.test'+path,{method,headers:{...(token?{Authorization:'Bearer '+token}:{}),'content-type':'application/json'},body:data?JSON.stringify(data):undefined}),env,ctx);
export async function user(env,platform='ios'){const response=await call(env,'/api/identities','POST',{platform});assert.equal(response.status,201);return response.json();}
export async function adminCall(env,owner,data,ctx){
 const expires=String(Date.now()+60000),key=await crypto.subtle.importKey('raw',new TextEncoder().encode(env.SESSION_SECRET),{name:'HMAC',hash:'SHA-256'},false,['sign']);
 const signature=Buffer.from(await crypto.subtle.sign('HMAC',key,new TextEncoder().encode(expires))).toString('hex');
 return worker.fetch(new Request('https://focusmint.test/api/admin/conversations/'+owner,{method:'POST',headers:{'content-type':'application/json',origin:'https://focusmint.test','x-focusmint-admin':'1',cookie:`focusmint_admin=${expires}.${signature}`},body:JSON.stringify(data)}),env,ctx);
}
