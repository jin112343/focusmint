const stmt=(env,sql,...args)=>env.DB.prepare(sql).bind(...args);
export const NOTIFY_TO='support@mizoi.app';
export const NOTIFY_FROM='notifications@focusmint-notify.mizoi.app';
const ADMIN_URL='https://focusmint-support.mizoijin-0201.workers.dev/admin';
export function notificationMessage(id,{test=false}={}){
 return {to:NOTIFY_TO,from:{email:NOTIFY_FROM,name:'FocusMint'},subject:test?'【FocusMint】お問い合わせ通知のテスト':'【FocusMint】お問い合わせが届いています',text:[test?'FocusMintのお問い合わせ通知の送信テストです。':'FocusMintで新しいお問い合わせが届いています。','','管理画面から内容を確認し、返信してください。',ADMIN_URL,'',`通知ID: ${id}`].join('\n'),headers:{'X-FocusMint-Notification-ID':id}};
}
export async function sendEmail(env,message){
 const {EmailMessage}=await import('cloudflare:email');
 const encoded=value=>btoa(String.fromCharCode(...new TextEncoder().encode(value)));
 const raw=[`From: FocusMint <${NOTIFY_FROM}>`,`To: ${NOTIFY_TO}`,`Subject: =?UTF-8?B?${encoded(message.subject)}?=`,`Message-ID: <focusmint-${message.headers['X-FocusMint-Notification-ID']}@focusmint-notify.mizoi.app>`,`Date: ${new Date().toUTCString()}`,'MIME-Version: 1.0','Content-Type: text/plain; charset=UTF-8','Content-Transfer-Encoding: base64','',encoded(message.text).match(/.{1,76}/g).join('\r\n')].join('\r\n');
 await env.EMAIL.send(new EmailMessage(NOTIFY_FROM,NOTIFY_TO,raw));
 return {messageId:message.headers['X-FocusMint-Notification-ID']};
}
export async function sendNotificationTest(env){return sendEmail(env,notificationMessage(crypto.randomUUID(),{test:true}));}
export async function dispatchEmail(env,{maximum=10,send=message=>sendEmail(env,message)}={}){
 if(!env.EMAIL)return {configured:false};
 const due=await stmt(env,"SELECT message_id FROM support_email_outbox WHERE attempts<6 AND ((state='pending' AND next_at<=?) OR (state='sending' AND lease_until<=?)) ORDER BY next_at LIMIT ?",Date.now(),Date.now(),Math.min(maximum,20)).all();
 let sent=0;
 for(const item of due.results){
  const claim=crypto.randomUUID();
  const job=await stmt(env,"UPDATE support_email_outbox SET state='sending',claim=?,lease_until=?,attempts=attempts+1 WHERE message_id=? AND attempts<6 AND ((state='pending' AND next_at<=?) OR (state='sending' AND lease_until<=?)) RETURNING *",claim,Date.now()+90000,item.message_id,Date.now(),Date.now()).first();
  if(!job)continue;
  try{
   const result=await send(notificationMessage(job.message_id));
   await stmt(env,"UPDATE support_email_outbox SET state='sent',provider_id=?,claim=NULL,lease_until=0,last_error=NULL WHERE message_id=? AND claim=?",result?.messageId||'',job.message_id,claim).run();sent++;
  }catch(error){
   // No customer text or provider credentials enter logs or notification emails.
   const code=typeof error.code==='string'&&/^[A-Z0-9_]{1,80}$/.test(error.code)?error.code:'SEND_FAILED';
   await stmt(env,"UPDATE support_email_outbox SET state=?,next_at=?,claim=NULL,lease_until=0,last_error=? WHERE message_id=? AND claim=?",job.attempts>=6?'failed':'pending',Date.now()+Math.min(3600000,60000*2**(job.attempts-1)),code,job.message_id,claim).run();
  }
 }
 await stmt(env,"UPDATE support_email_outbox SET state='failed',claim=NULL,lease_until=0,last_error='ATTEMPTS_EXHAUSTED' WHERE state='sending' AND lease_until<=? AND attempts>=6",Date.now()).run();
 return {configured:true,sent};
}
