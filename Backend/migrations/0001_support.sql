PRAGMA foreign_keys=ON;
CREATE TABLE IF NOT EXISTS identities (
 id TEXT PRIMARY KEY, token_hash TEXT NOT NULL UNIQUE, platform TEXT NOT NULL CHECK(platform IN ('ios','android')),
 language TEXT NOT NULL DEFAULT 'en', version TEXT NOT NULL DEFAULT '1.0', created_at INTEGER NOT NULL, updated_at INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS messages (
 id TEXT PRIMARY KEY, owner TEXT NOT NULL REFERENCES identities(id) ON DELETE CASCADE,
 author TEXT NOT NULL CHECK(author IN ('user','developer','automatic')), body TEXT NOT NULL DEFAULT '',
 image_key TEXT, day TEXT, created_at INTEGER NOT NULL, is_read INTEGER NOT NULL DEFAULT 0,
 CHECK(length(body)<=2000)
);
CREATE INDEX IF NOT EXISTS conversation_messages ON messages(owner,created_at,id);
CREATE TABLE IF NOT EXISTS quotas (
 owner TEXT NOT NULL REFERENCES identities(id) ON DELETE CASCADE, day TEXT NOT NULL,
 count INTEGER NOT NULL DEFAULT 0 CHECK(count BETWEEN 0 AND 3), PRIMARY KEY(owner,day)
);
CREATE TRIGGER IF NOT EXISTS message_quota BEFORE INSERT ON messages WHEN NEW.author='user' BEGIN
 INSERT INTO quotas(owner,day,count) VALUES(NEW.owner,NEW.day,0) ON CONFLICT DO NOTHING;
 SELECT CASE WHEN (SELECT count FROM quotas WHERE owner=NEW.owner AND day=NEW.day)>=3 THEN RAISE(ABORT,'daily_quota') END;
 UPDATE quotas SET count=count+1 WHERE owner=NEW.owner AND day=NEW.day;
END;
CREATE TABLE IF NOT EXISTS limits (key TEXT PRIMARY KEY, count INTEGER NOT NULL, expires_at INTEGER NOT NULL);

PRAGMA foreign_keys=ON;

-- Keep reply receipts after history deletion: retrying an old developer UUID must
-- never grant a second allowance. Existing messages are unread, without resetting
-- their owner's quota or sending historical notifications during this migration.
CREATE TABLE support_replies (
 sequence INTEGER PRIMARY KEY AUTOINCREMENT,
 message_id TEXT NOT NULL UNIQUE,
 owner TEXT NOT NULL REFERENCES identities(id) ON DELETE CASCADE,
 created_at INTEGER NOT NULL,
 read_at INTEGER
);
CREATE INDEX support_replies_owner ON support_replies(owner,sequence);
INSERT INTO support_replies(message_id,owner,created_at)
 SELECT id,owner,created_at FROM messages WHERE author='developer' ORDER BY created_at,id;
CREATE TABLE support_state (
 owner TEXT PRIMARY KEY REFERENCES identities(id) ON DELETE CASCADE,
 revision INTEGER NOT NULL DEFAULT 0
);
INSERT INTO support_state(owner,revision) SELECT owner,COUNT(*) FROM messages GROUP BY owner;

CREATE TRIGGER support_reply_duplicate BEFORE INSERT ON messages
 WHEN NEW.author='developer' AND EXISTS(SELECT 1 FROM support_replies WHERE message_id=NEW.id)
 BEGIN
 SELECT CASE WHEN (SELECT owner FROM support_replies WHERE message_id=NEW.id)<>NEW.owner THEN RAISE(ABORT,'reply_id_conflict') END;
 SELECT RAISE(IGNORE);
 END;
CREATE TRIGGER support_reply_reserved_id BEFORE INSERT ON messages
 WHEN NEW.author<>'developer' AND EXISTS(SELECT 1 FROM support_replies WHERE message_id=NEW.id)
 BEGIN SELECT RAISE(ABORT,'reply_id_conflict'); END;
CREATE TRIGGER support_reply_receipt AFTER INSERT ON messages WHEN NEW.author='developer'
 BEGIN
 INSERT INTO support_replies(message_id,owner,created_at) VALUES(NEW.id,NEW.owner,NEW.created_at);
 END;
CREATE TRIGGER support_reply_allowance AFTER INSERT ON support_replies
 BEGIN
 INSERT INTO quotas(owner,day,count) VALUES(NEW.owner,date(NEW.created_at/1000,'unixepoch'),0)
 ON CONFLICT(owner,day) DO UPDATE SET count=0;
 END;
CREATE TRIGGER support_message_revision AFTER INSERT ON messages WHEN NEW.author IN ('user','developer')
 BEGIN
 INSERT INTO support_state(owner,revision) VALUES(NEW.owner,1) ON CONFLICT(owner) DO UPDATE SET revision=revision+1;
 END;
CREATE TRIGGER support_read_revision AFTER UPDATE OF read_at ON support_replies WHEN OLD.read_at IS NULL AND NEW.read_at IS NOT NULL
 BEGIN
 INSERT INTO support_state(owner,revision) SELECT NEW.owner,1 WHERE EXISTS(SELECT 1 FROM identities WHERE id=NEW.owner) ON CONFLICT(owner) DO UPDATE SET revision=revision+1;
 END;
CREATE TRIGGER support_delete_revision AFTER DELETE ON messages
 BEGIN
 INSERT INTO support_state(owner,revision) SELECT OLD.owner,1 WHERE EXISTS(SELECT 1 FROM identities WHERE id=OLD.owner) ON CONFLICT(owner) DO UPDATE SET revision=revision+1;
 END;
CREATE TRIGGER support_reply_deleted BEFORE DELETE ON messages WHEN OLD.author='developer'
 BEGIN
 UPDATE support_replies SET read_at=COALESCE(read_at,CAST(strftime('%s','now') AS INTEGER)*1000) WHERE message_id=OLD.id;

 END;
