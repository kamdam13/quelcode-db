SELECT
    u.name AS user_name
,   c.name AS chatroom_name
,   DATE(p.participated_at) AS participated_at
FROM
    participants p
INNER JOIN
    users u
ON
    p.user_id = u.id
INNER JOIN
    chatrooms c
ON
    p.chatroom_id = c.id
WHERE
    u.is_deleted = 0
AND c.is_deleted = 0
ORDER BY
    p.participated_at ASC
;
