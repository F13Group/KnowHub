--Field for count of views of question
ALTER TABLE questions ADD COLUMN views bigint DEFAULT 0 NOT NULL CHECK(views>-1);
--Field for full text of question
ALTER TABLE questions ADD COLUMN description text;
--Field autor of question
ALTER TABLE questions ADD COLUMN user_id bigint;
--Foreign key for user_id in questions
ALTER TABLE questions ADD CONSTRAINT questions_user_id_fkey FOREIGN KEY (user_id)
      REFERENCES users (user_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION