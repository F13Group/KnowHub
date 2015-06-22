INSERT INTO categories (value) VALUES 
('Java'), 
('.NET'), 
('FT'), 
('AT'), 
('FE'), 
('Others');

INSERT INTO tags (value) VALUES 
('tag1'), 
('tag2'), 
('tag3');

INSERT INTO questions (value, load_date, rating) VALUES 
('question1', '11/06/2015', 5),
('question2', '12/06/2015', 4), 
('question3', '13/06/2015', 3), 
('question4', '14/06/2015', 0), 
('question5', '15/06/2015', 3), 
('question6', '16/06/2015', 2), 
('question7', '17/06/2015', 1), 
('question8', '18/06/2015', 3), 
('question9', '19/06/2015', 5), 
('question10', '20/06/2015', 2);

INSERT INTO question_categories (question_id, category_id) VALUES
(1,1),
(2,2),
(3,3),
(4,1),
(5,2),
(6,3),
(7,4),
(8,5),
(9,6),
(10,3);