
package ua.f13group.KnowHub.domain;


import java.security.Timestamp;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityResult;
import javax.persistence.FetchType;
import javax.persistence.FieldResult;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@NamedQueries({
    @NamedQuery(name = "Comment.getAllQuestionComments", query = "SELECT c FROM Comment c WHERE c.question.id = :questionId ORDER BY c.rating DESC"),
    @NamedQuery(name = "Comment.getAllAuthorsComments", query = "SELECT c FROM Comment c WHERE c.user.userId = :userId ORDER BY c.rating DESC"),
    @NamedQuery(name = "Comment.getAllCommentConcreteLikers", query = "SELECT l.user FROM Like l WHERE l.comment.id = :commentId and l.positive = :isPositive"),
})

@NamedNativeQuery(name = "Comment.findExactNumberOfCommentsStartingFromCurrentOne", query = "select * from"
			+ " ( select *, row_number() over (order by rating desc) as rn from comments where question_id = :questionId) as foo"
			+ " where rn > ( select rn from ( select *, row_number() over (order by rating desc) as rn from comments where question_id = :questionId) as foo"
			+ " where comment_id = :commentId)", resultSetMapping = "CommentMapping")
@SqlResultSetMapping(name = "CommentMapping", entities = @EntityResult(entityClass = Comment.class, fields = {
		@FieldResult(name = "id", column = "comment_id"), @FieldResult(name = "value", column = "value"),
		@FieldResult(name = "date", column = "load_date"), @FieldResult(name = "user", column = "user_id"),
		@FieldResult(name = "question", column = "question_id"), @FieldResult(name = "likes", column = "like_id")
}))

@Entity
@Table(name = "comments")
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comment_id")
	private Long id;

	@Column(name = "value")
	private String value;
	
	@Column(name = "load_date")
	@Temporal(value=TemporalType.TIMESTAMP)
	private Date date; 

	@Column(name = "rating")
	private int rating;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "question_id")
	private Question question;
	
	@OneToMany(mappedBy = "comment", fetch = FetchType.EAGER)
	private List<Like> likes;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public List<Like> getLikes() {
		return likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}
	
	
	
}
