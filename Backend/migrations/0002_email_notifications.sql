PRAGMA foreign_keys=ON;
CREATE TABLE support_email_outbox (
 message_id TEXT PRIMARY KEY REFERENCES messages(id) ON DELETE CASCADE,
 owner TEXT NOT NULL REFERENCES identities(id) ON DELETE CASCADE,
 created_at INTEGER NOT NULL,
 state TEXT NOT NULL DEFAULT 'pending' CHECK(state IN ('pending','sending','sent','failed')),
 attempts INTEGER NOT NULL DEFAULT 0,
 next_at INTEGER NOT NULL,
 lease_until INTEGER NOT NULL DEFAULT 0,
 claim TEXT,
 provider_id TEXT,
 last_error TEXT
);
CREATE INDEX support_email_due ON support_email_outbox(state,next_at,lease_until);
CREATE TRIGGER support_inquiry_email AFTER INSERT ON messages WHEN NEW.author='user'
 BEGIN
 INSERT INTO support_email_outbox(message_id,owner,created_at,next_at) VALUES(NEW.id,NEW.owner,NEW.created_at,NEW.created_at);
 END;
