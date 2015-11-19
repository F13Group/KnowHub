SELECT q.question_id, q.value, q.load_date, q.category_id, count (r.user_id) as rating, 
	(SELECT count(r.rating_id)>0 as asked FROM ratings r WHERE r.user_id = 5 and r.question_id = q.question_id),
	(SELECT count(b.bookmark_id)>0 as bookmarked FROM bookmarks b WHERE b.user_id = 5 and b.question_id = q.question_id)
FROM questions q LEFT JOIN ratings r ON r.question_id = q.question_id
GROUP BY q.question_id
ORDER BY q.question_id

