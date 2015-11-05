CREATE TABLE bookmarks (
  question_id bigint NOT NULL,
  user_id bigint NOT NULL,
  bookmark_id bigserial NOT NULL,
  PRIMARY KEY (bookmark_id),
  FOREIGN KEY (question_id) REFERENCES questions (question_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
)