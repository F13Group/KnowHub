package ua.f13group.KnowHub.domain;

import java.security.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Comment {

	@Id
	@GeneratedValue
	@Column(name = "comment_id")
	private Long id;

	@Column(name = "value")
	private String value;

	@Column(name = "load_date")
	private Timestamp date;

	@Column(name = "rating")
	private int rating;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private Long user_id;

	@Column(name = "question_id")
	private Long question_id;
	
	@OneToMany(mappedBy = "comment_id")
	private List<Like> likes;
	
	
}
