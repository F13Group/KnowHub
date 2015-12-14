package ua.f13group.KnowHub.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Like {

	@Id
	@GeneratedValue
	@Column(name = "like_id")
	private Long id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@Column(name = "positive")
	private boolean positive;

	@ManyToOne
	@JoinColumn(name = "comment_id")
	private Comment comment;

}
