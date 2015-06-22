SET datestyle = dmy;

INSERT INTO categories (value) VALUES 
('Java'), 
('.NET'), 
('FT'), 
('AT'), 
('FE'), 
('Others'),
('C#');

INSERT INTO tags (value) VALUES 
('tag1'), 
('tag2'), 
('tag3');

INSERT INTO questions (value, load_date, rating) VALUES 
('Test for copy questions?', '12/06/2015', 5),
('Test for copy questions?', '11/06/2015', 4), 
('Questions 9', '10/06/2015', 3), 
('.?*(орлоп)!', '10/06/2015', 0), 
('Кириллица+English', '10/06/2015', 3), 
('Кириллица', '10/06/2015', 2), 
('1235', '10/06/2015', 1), 
('ASDAFGG', '10/06/2015', 3), 
('OoooooooooooooooooooooooooooooooooooooooooooooooooOoooooooooooooooooooooooooooooooooooooooooooooooooOooooooooooooooooooooooooooooooooooooooo', '10/06/2015', 5), 
('question10', '10/06/2015', 2)
;

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