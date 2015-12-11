ALTER TABLE comments ADD
(
like_id bigint,
FOREIGN KEY (like_id) REFERENCES likes(like_id)
)