package ua.f13group.KnowHub.domain;

import java.sql.Timestamp;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "questions")
@NamedQueries({
    @NamedQuery(name = "Question.findAll", query = "SELECT q FROM Question q"),
  //  @NamedQuery(name = "Question.getPage", query = "SELECT q FROM Question q"),
  //  @NamedQuery(name = "Question.getPagesCount", query = "SELECT Count(q) FROM Question q"),
    @NamedQuery(name = "Question.findAll", query = "SELECT q FROM Question q WHERE q.category = :category"),
    
})
public class Question implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="question_id")
	Long id;
	String value;
	@Column(name="load_date")
	Timestamp loadDate;
	Long rating;
	@Column(name="user_id")
	Long userId;
	
	public Question() {}
	
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
	public Timestamp getLoadDate() {
		return loadDate;
	}
	public void setLoadDate(Timestamp loadDate) {
		this.loadDate = loadDate;
	}
	public Long getRating() {
		return rating;
	}
	public void setRating(Long rating) {
		this.rating = rating;
	}
	public Long getPostId() {
		return userId;
	}
	public void setPostId(Long userId) {
		this.userId = userId;
	}
}
