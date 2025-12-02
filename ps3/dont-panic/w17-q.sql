.output pow-w17.txt
.mode box
.headers on


--  fire the INSERT trigger

-- .print 'query 1INSERT trigger demo'

-- .print 'show users count and last 5 user_logs'
-- SELECT COUNT(*) AS user_count FROM users;
-- SELECT id, type, old_username, new_username, old_password, new_password
-- FROM user_logs ORDER BY id DESC LIMIT 5;

-- .print 'insert a new throwaway user to trigger INSERT log'
-- INSERT INTO users (username, password)
-- VALUES ('probe_user', 'abc123');

-- .print 'confirm user exists and log row was written'
-- SELECT id, username FROM users WHERE username='probe_user';
-- SELECT id, type, old_username, new_username, old_password, new_password
-- FROM user_logs ORDER BY id DESC LIMIT 5;


.print 'update the trigger demo'
.print 'show probe_user current password n last 5 logs'
SELECT username, password FROM users WHERE username='probe_user';
SELECT id, type, old_username, new_username, old_password, new_password
FROM user_logs ORDER BY id DESC LIMIT 5;

.print 'update probe_user password to trigger update log'
UPDATE users
SET password = 'newpass!'
WHERE username = 'probe_user';

.print 'verify row changed and a new update log was written'
SELECT username, password FROM users WHERE username='probe_user';
SELECT id, type, old_username, new_username, old_password, new_password
FROM user_logs ORDER BY id DESC LIMIT 5;


.output stdout






--bash sqlite3 dontpanic.db < w17-q.sql