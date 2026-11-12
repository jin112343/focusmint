import {test} from 'node:test';
import assert from 'node:assert/strict';
import {dispatchEmail,notificationMessage} from '../src/email.mjs';
import {environment,call,user,adminCall} from './helpers.mjs';
test('one notification per accepted user message, no reply or duplicate notifications',async()=>{
 const env=environment(),u=await user(env),id=crypto.randomUUID();const data={id,body:'Private inquiry not for email'};
 await call(env,'/api/messages','POST',data,u.token);await call(env,'/api/messages','POST',data,u.token);
 await adminCall(env,u.id,{id:crypto.randomUUID(),body:'Private reply'});
 assert.equal(env.database.prepare('SELECT COUNT(*) AS n FROM support_email_outbox').get().n,1);
 const sent=[];env.EMAIL={send:async message=>{sent.push(message);return {messageId:'email-accepted'};}};
 await Promise.all([dispatchEmail(env,{send:env.EMAIL.send}),dispatchEmail(env,{send:env.EMAIL.send})]);assert.equal(sent.length,1);assert.equal(sent[0].to,'support@mizoi.app');assert.ok(!JSON.stringify(sent).includes(data.body));
 assert.match(sent[0].text,/FocusMint/);await dispatchEmail(env,{send:env.EMAIL.send});assert.equal(sent.length,1);
});
test('email outage does not lose the inquiry and retries the durable job',async()=>{
 const env=environment(),u=await user(env);await call(env,'/api/messages','POST',{id:crypto.randomUUID(),body:'Help'},u.token);
 env.EMAIL={send:async()=>{throw Object.assign(new Error('do not log private data'),{code:'E_INTERNAL_SERVER_ERROR'});}};
 await dispatchEmail(env,{send:env.EMAIL.send});let job=env.database.prepare('SELECT * FROM support_email_outbox').get();assert.equal(job.state,'pending');assert.equal(job.attempts,1);
 env.database.prepare('UPDATE support_email_outbox SET next_at=0').run();env.EMAIL.send=async()=>({messageId:'ok'});await dispatchEmail(env,{send:env.EMAIL.send});
 job=env.database.prepare('SELECT * FROM support_email_outbox').get();assert.equal(job.state,'sent');assert.equal(job.attempts,2);
});
test('deleting history cancels queued notifications and destinations cannot be overridden',async()=>{
 const env=environment(),u=await user(env);await call(env,'/api/messages','POST',{id:crypto.randomUUID(),body:'Delete'},u.token);await call(env,'/api/messages','DELETE',null,u.token);
 assert.equal(env.database.prepare('SELECT COUNT(*) AS n FROM support_email_outbox').get().n,0);assert.equal(notificationMessage('id').to,'support@mizoi.app');
});
