package ua.f13group.KnowHub.domain;

import javax.persistence.*;

/**
 * Created by dennis on 10/20/2015.
 */
@NamedQueries({
        @NamedQuery(name = "Rating.countLikesByQuestionId", query = "SELECT count (r.question.id) FROM Rating r where r.question.id=:questionId"),
        @NamedQuery(name = "Rating.ifLiked", query = "SELECT count(r.id)>0 as my_bool FROM Rating r WHERE r.userId = :userId and r.question.id=:questionId"),
    /*@NamedQuery(name = "User.findByLink", query = "SELECT u FROM User u WHERE u.link = :link")*/
})

@Entity
@Table(name = "ratings")
public class Rating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rating_id")
    private Long id;
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="question_id")
    private Question question;
//    @Column(name = "question_id")
//    private Long questionId;
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

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
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
        if (!question.getId().equals(rating.question.getId())) return false;
        return userId.equals(rating.userId);

    }

    @Override
    public int hashCode() {
        int result = id.hashCode();
        result = 31 * result + question.getId().hashCode();
        result = 31 * result + userId.hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "RatingRepository{" +
                "id=" + id +
                ", questionId=" + question.getId() +
                ", userId=" + userId +
                '}';
    }
}
