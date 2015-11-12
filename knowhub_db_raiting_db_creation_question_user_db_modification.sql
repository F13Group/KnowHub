ALTER TABLE users ALTER COLUMN login TYPE character varying(64);

ALTER TABLE users ALTER COLUMN password TYPE character varying(64);

ALTER TABLE questions DROP COLUMN rating;

ALTER TABLE questions DROP COLUMN user_id;

CREATE TABLE ratings
(
  rating_id bigserial NOT NULL,
  question_id bigint,
  user_id bigint,
  CONSTRAINT ratings_pkey PRIMARY KEY (rating_id),
  CONSTRAINT ratings_question_id_fkey FOREIGN KEY (question_id)
      REFERENCES questions (question_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id)
      REFERENCES users (user_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)

