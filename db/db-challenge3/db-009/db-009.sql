SELECT
	COUNT(p.id) AS 投稿数
,	c.name AS chatroom_name
FROM
	posts p
INNER JOIN
	chatrooms c
ON
	p.chatroom_id = c.id
INNER JOIN
	users u
ON p.created_user_id = u.id
WHERE
	u.is_deleted = 0
AND p.is_deleted = 0
GROUP BY
	p.chatroom_id
ORDER BY
	投稿数 DESC
;
