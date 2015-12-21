package ua.f13group.KnowHub.domain;

<<<<<<< HEAD
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
=======
import javax.persistence.*;
>>>>>>> refs/remotes/origin/dennis_branch

@Entity
@Table(name = "likes")

@NamedQueries({
		@NamedQuery(name = "Like.getLikeIdByUserIdAndCommentId", query = "SELECT l.id FROM Like l WHERE l.user.id = :userId AND l.comment.id =:commentId"),
})
public class Like {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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

	public Like(){}

	public Like (Long id){
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isPositive() {
		return positive;
	}

	public void setPositive(boolean positive) {
		this.positive = positive;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}
	
}
