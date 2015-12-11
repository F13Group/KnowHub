ALTER TABLE comments ADD like_id bigint;

ALTER TABLE comments ADD FOREIGN KEY (like_id) REFERENCES likes(like_id);

ALTER TABLE comments ADD parent_comment_id bigint;

ALTER TABLE comments ADD child_comment_id bigint;

ALTER TABLE comments ADD FOREIGN KEY (parent_comment_id) REFERENCES comments(comment_id);