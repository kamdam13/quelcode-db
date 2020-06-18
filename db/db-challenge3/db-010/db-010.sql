SELECT
	u.name AS ユーザー名
,	p.created_at AS 投稿日時
,	c.name AS チャットルーム名
,	u.id
FROM
	posts p
INNER JOIN
	users u
ON
	p.created_user_id = u.id
INNER JOIN
	chatrooms c
ON
	p.chatroom_id = c.id
WHERE
	p.is_deleted = 0
AND u.is_deleted = 0
AND p.created_at = (
					SELECT
						MAX(p2.created_at)
					FROM
						posts p2
					INNER JOIN
						users u2
					ON 
						p2.created_user_id = u2.id 
					WHERE
						p.chatroom_id = p2.chatroom_id
					AND p2.is_deleted = 0
					AND u2.is_deleted = 0
					GROUP BY
						p2.chatroom_id
					)
ORDER BY
	p.chatroom_id ASC
;
