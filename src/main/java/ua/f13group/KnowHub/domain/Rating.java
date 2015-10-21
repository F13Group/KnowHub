package ua.f13group.KnowHub.domain;

import javax.persistence.*;

/**
 * Created by dennis on 10/20/2015.
 */
@NamedQueries({
        @NamedQuery(name = "Rating.countLikesByQuestionId", query = "SELECT count (r.questionId) FROM Rating r where r.questionId=:questionId"),
        @NamedQuery(name = "Rating.ifLiked", query = "SELECT count(r.id)>0 as my_bool FROM Rating r WHERE r.userId = :userId and r.questionId=:questionId"),
    /*@NamedQuery(name = "User.findByLink", query = "SELECT u FROM User u WHERE u.link = :link")*/
})

@Entity
@Table(name = "ratings")
public class Rating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rating_id")
    private Long id;
    @Column(name = "question_id")
    private Long questionId;
    @Column(name = "user_id")
    private Long userId;

    public Rating(){
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

        Rating rating = (Rating) o;

        if (!id.equals(rating.id)) return false;
        if (!questionId.equals(rating.questionId)) return false;
        return userId.equals(rating.userId);

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
        return "RatingRepository{" +
                "id=" + id +
                ", questionId=" + questionId +
                ", userId=" + userId +
                '}';
    }
}
