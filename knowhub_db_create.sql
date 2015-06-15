DROP DATABASE IF EXISTS knowhub;
CREATE DATABASE knowhub
   WITH OWNER = postgres
   ENCODING = 'UTF8';  
 

CREATE TABLE categories (
    category_id bigserial,
    value varchar(250) NOT NULL,
    PRIMARY KEY(category_id)
);

;
CREATE TABLE tags (
    tag_id bigserial,
    value varchar(250) NOT NULL,
    PRIMARY KEY(tag_id)
);


CREATE TABLE users(
    user_id bigserial,
    login varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    enabled boolean NOT NULL,
    PRIMARY KEY(user_id)
);


CREATE TABLE authorities(
    authority_id bigserial,
    user_id bigint NOT NULL,
    authority varchar(50) NOT NULL,
    PRIMARY KEY(authority_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


CREATE TABLE questions(
    question_id bigserial,
    value text NOT NULL,
    load_date timestamp,
    rating bigint,
    user_id bigint,
    PRIMARY KEY(question_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


CREATE TABLE question_tags(
    question_tag_id bigserial,
    question_id bigint,
    tag_id bigint,
    PRIMARY KEY(question_tag_id),
    FOREIGN KEY (question_id) REFERENCES questions (question_id),
    FOREIGN KEY (tag_id) REFERENCES tags (tag_id)
);


CREATE TABLE question_categories(
    question_category_id bigserial,
    question_id bigint,
    category_id bigint,
    PRIMARY KEY(question_category_id),
    FOREIGN KEY (question_id) REFERENCES questions (question_id),
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
);


CREATE TABLE comments(
    comment_id bigserial,
    value text NOT NULL,
    load_date timestamp ,
    rating bigint,
    user_id bigint,
    question_id bigint,
    PRIMARY KEY(comment_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (question_id) REFERENCES questions(question_id)
);


CREATE TABLE user_settings(
    user_setting_id bigserial,
    num_of_records_on_page bigint,
    user_id bigint,
    PRIMARY KEY(user_setting_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

