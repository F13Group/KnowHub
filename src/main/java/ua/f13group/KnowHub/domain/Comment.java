package ua.f13group.KnowHub.domain;

<<<<<<< HEAD
public class Comment {

	private Long id;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
=======
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
	private User user;

	@ManyToOne
	@JoinColumn(name = "question_id")
	private Question question;
	
	@OneToMany(mappedBy = "comment")
	private List<Like> likes;
>>>>>>> refs/remotes/origin/DmytroKorniienko
	
	
}
