const stmt=(env,sql,...args)=>env.DB.prepare(sql).bind(...args);
const encoder=new TextEncoder();
export class SupportError extends Error {constructor(status,code){super(code);this.status=status;}}
const fail=(status,code)=>{throw new SupportError(status,code);};
const utcDay=()=>new Date().toISOString().slice(0,10);

export async function supportStatus(env,owner){
 // One statement gives clients a coherent revision and status snapshot.
 const status=await stmt(env,`SELECT
  COALESCE((SELECT revision FROM support_state WHERE owner=?1),0) AS revision,
  (SELECT COUNT(*) FROM support_replies r JOIN messages m ON m.id=r.message_id WHERE r.owner=?1 AND r.read_at IS NULL) AS unreadCount,
  (SELECT r.message_id FROM support_replies r JOIN messages m ON m.id=r.message_id WHERE r.owner=?1 AND r.read_at IS NULL ORDER BY r.sequence DESC LIMIT 1) AS unreadThrough,
  (SELECT message_id FROM support_replies WHERE owner=?1 AND read_at IS NOT NULL ORDER BY sequence DESC LIMIT 1) AS lastReadMessageId,
  3-COALESCE((SELECT count FROM quotas WHERE owner=?1 AND day=?2),0) AS remainingToday`,owner,utcDay()).first();
 return {...status,resetAt:new Date(Date.parse(utcDay())+86400000).toISOString()};
}
export async function acknowledgeSupport(env,owner,data){
 if(typeof data.throughMessageId!=='string')fail(400,'invalid_read_marker');
 const target=await stmt(env,'SELECT r.sequence FROM support_replies r JOIN messages m ON m.id=r.message_id WHERE r.message_id=? AND r.owner=?',data.throughMessageId,owner).first();
 if(!target)fail(404,'not_found');
 await stmt(env,'UPDATE support_replies SET read_at=COALESCE(read_at,?) WHERE owner=? AND sequence<=?',Date.now(),owner,target.sequence).run();
 return supportStatus(env,owner);
}
