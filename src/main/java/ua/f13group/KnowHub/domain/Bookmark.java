<<<<<<< HEAD
package ua.f13group.KnowHub.domain;

import javax.persistence.*;

@NamedQueries({
    @NamedQuery(name = "Bookmark.isBookmarked", query = "SELECT count(b.id)>0 as my_bool FROM Bookmark b WHERE b.userId = :userId and b.questionId=:questionId"),
    @NamedQuery(name = "Bookmark.unbookmark", query = "DELETE FROM Bookmark b WHERE b.userId = :userId and b.questionId=:questionId")
})

@Entity
@Table(name = "bookmarks")
public class Bookmark {
	 	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "bookmark_id")
	    private Long id;
	 	
	    @Column(name = "question_id")
	    private Long questionId;
	    
	    @Column(name = "user_id")
	    private Long userId;

	    public Bookmark() {
	    }

	    public Long getId() {
	        return id;
	    }

	    public void setId(Long id) {
	        this.id = id;
	    }

	    public Long getQuestionId() {
	        return questionId;
	    }

	    public void setQuestionId(Long questionId) {
	        this.questionId = questionId;
	    }

	    public Long getUserId() {
	        return userId;
	    }

	    public void setUserId(Long userId) {
	        this.userId = userId;
	    }


	    @Override
	    public boolean equals(Object o) {
	        if (this == o) return true;
	        if (o == null || getClass() != o.getClass()) return false;

	        Bookmark bookmark = (Bookmark) o;

	        if (!id.equals(bookmark.id)) return false;
	        if (!questionId.equals(bookmark.questionId)) return false;
	        return userId.equals(bookmark.userId);

	    }

	    @Override
	    public int hashCode() {
	        int result = id.hashCode();
	        result = 31 * result + questionId.hashCode();
	        result = 31 * result + userId.hashCode();
	        return result;
	    }

	    @Override
	    public String toString() {
	        return "Bookmark{" +
	                "id=" + id +
	                ", questionId=" + questionId +
	                ", userId=" + userId +
	                '}';
	    }
}
=======
package ua.f13group.KnowHub.domain;


import javax.persistence.*;

@NamedQueries({
        @NamedQuery(name = "Bookmark.isBookmarked", query = "SELECT count(b.id)>0 as my_bool FROM Bookmark b WHERE b.userId = :userId and b.questionId=:questionId"),
        @NamedQuery(name = "Bookmark.unbookmark", query = "DELETE FROM Bookmark b WHERE b.userId = :userId and b.questionId=:questionId")
})

@Entity
@Table(name = "bookmarks")
public class Bookmark {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bookmark_id")
    private Long id;
    @Column(name = "question_id")
    private Long questionId;
    @Column(name = "user_id")
    private Long userId;

    public Bookmark() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Bookmark bookmark = (Bookmark) o;

        if (!id.equals(bookmark.id)) return false;
        if (!questionId.equals(bookmark.questionId)) return false;
        return userId.equals(bookmark.userId);

    }

    @Override
    public int hashCode() {
        int result = id.hashCode();
        result = 31 * result + questionId.hashCode();
        result = 31 * result + userId.hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "Bookmark{" +
                "id=" + id +
                ", questionId=" + questionId +
                ", userId=" + userId +
                '}';
    }
}
>>>>>>> refs/remotes/origin/VitalinaVitiuk
