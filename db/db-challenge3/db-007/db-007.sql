SELECT
    id
,   name
,   description
,   CASE
        WHEN
            is_allow_file_transmission = 1
        THEN
            '許可'
        ELSE
            '禁止'
    END AS is_allow_file_transmission
,   is_direct_chat
,   created_at
,   created_user_id
,   modified_at
,   modified_user_id
FROM
    chatrooms
WHERE
    description LIKE '%ダイレクトチャット'
AND is_deleted = 0
ORDER BY
    id ASC
;