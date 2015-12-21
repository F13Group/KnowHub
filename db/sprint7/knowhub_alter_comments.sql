ALTER TABLE comments ADD like_id bigint;

ALTER TABLE comments ADD FOREIGN KEY (like_id) REFERENCES likes(like_id);