BEGIN;
CREATE TABLE users (
    id INTEGER(11) NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    comment VARCHAR(1000),
    cell_phone_number VARCHAR(13),
    work_phone_number VARCHAR(13),
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    created DATETIME NOT NULL,
    modified TIMESTAMP NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE rooms(
    id INTEGER(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(1000),
    is_allow_file_trasmission TINYINT(1) DEFAULT 1 NOT NULL,
    is_direct_chat TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    created DATETIME NOT NULL,
    created_user_id INTEGER(11) NOT NULL,
    modified TIMESTAMP NOT NULL,
    modified_user_id INTEGER(11) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(created_user_id) REFERENCES users(id),
    FOREIGN KEY(modified_user_id) REFERENCES users(id)
);

CREATE TABLE participants(
    user_id INTEGER(11) NOT NULL,
    room_id INTEGER(11) NOT NULL,
    created DATETIME NOT NULL,
    PRIMARY KEY(user_id,room_id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(room_id) REFERENCES rooms(id)
);

CREATE TABLE tasks(
    id INTEGER(11) NOT NULL AUTO_INCREMENT,
    description VARCHAR(1000) NOT NULL,
    assigned_user_id INTEGER(11) NOT NULL,
    room_id INTEGER(11) NOT NULL,
    time_limit DATETIME,
    is_completed TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    created DATETIME NOT NULL,
    created_user_id INTEGER(11) NOT NULL,
    modified TIMESTAMP NOT NULL,
    modified_user_id INTEGER(11) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(assigned_user_id) REFERENCES users(id),
    FOREIGN KEY(room_id) REFERENCES rooms(id),
    FOREIGN KEY(created_user_id) REFERENCES users(id),
    FOREIGN KEY(modified_user_id) REFERENCES users(id)
);

CREATE TABLE posts(
    id INTEGER(11) NOT NULL AUTO_INCREMENT,
    room_id INTEGER(11) NOT NULL REFERENCES rooms(id),
    content VARCHAR(1000) NOT NULL,
    file_name VARCHAR(100),
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    created DATETIME NOT NULL,
    created_user_id INTEGER(11) NOT NULL,
    modified TIMESTAMP NOT NULL,
    modified_user_id INTEGER(11) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(created_user_id) REFERENCES users(id),
    FOREIGN KEY(modified_user_id) REFERENCES users(id)
);
COMMIT;