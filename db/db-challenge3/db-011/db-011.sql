BEGIN;
UPDATE
	tasks
SET
	is_completed = 1
,	modified_at = NOW()
,	modified_user_id = 1
WHERE
	is_deleted = 0
AND created_at BETWEEN '2020-04-26 09:00:00' AND '2020-04-26 11:30:00'
;
COMMIT;
