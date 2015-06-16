package ua.f13group.KnowHub.domain;

import java.time.LocalDateTime;
import javax.persistence.*;

@Entity
@Table(name = "questions")
@NamedQueries({
    @NamedQuery(name = "Question.findAll", query = "SELECT q FROM Question q")
})
public class Question {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	String value;
	LocalDateTime loadDate;
	Long rating;
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
	public LocalDateTime getLoadDate() {
		return loadDate;
	}
	public void setLoadDate(LocalDateTime loadDate) {
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
