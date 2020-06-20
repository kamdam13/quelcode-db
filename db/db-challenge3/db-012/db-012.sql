BEGIN;
UPDATE
	chatrooms
SET
	is_allow_file_transmission = 0
,	modified_user_id = 1
,	modified_at = NOW()
WHERE 
	id NOT IN (
			SELECT 
				chatroom_id
			FROM
				participants
			WHERE
				user_id = 1
			)
AND is_deleted = 0
;
COMMIT;
