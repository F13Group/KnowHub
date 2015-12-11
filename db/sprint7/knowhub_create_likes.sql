CREATE TABLE likes
(
like_id bigint,
user_id bigint,
positive boolean,
comment_id bigint,
PRIMARY KEY(like_id),
FOREIGN KEY(user_id) REFERENCES users(user_id),
FOREIGN KEY(comment_id) REFERENCES comments(comment_id)
)