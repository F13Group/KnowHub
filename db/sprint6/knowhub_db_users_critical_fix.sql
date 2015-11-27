-- Fix for non-unique field login in table users

ALTER TABLE users ADD CONSTRAINT login UNIQUE (login);