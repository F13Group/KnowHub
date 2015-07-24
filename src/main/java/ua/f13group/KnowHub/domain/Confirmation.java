package ua.f13group.KnowHub.domain;

import java.sql.Timestamp;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "confirmations")
@NamedQueries({
    @NamedQuery(name = "Confirmation.findByLink", query = "SELECT c FROM Confirmation c WHERE c.link = :link "),
    @NamedQuery(name = "Confirmation.findByUserId", query = "SELECT c FROM Confirmation c WHERE c.user.userId = :userid "),
    @NamedQuery(name = "Confirmation.findByLogin", query = "SELECT c FROM Confirmation c WHERE c.user.login = :login ")
})
public class Confirmation {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "conf_id")
	private Long confirmationId;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	
	@Column(name = "link")
	private String link;
	    
	@Column(name = "reg_date")
	private Timestamp regDate ;
	
	public Confirmation(){
		regDate = new Timestamp(Calendar.getInstance().getTimeInMillis());
	}
	
	public Confirmation(User user){
		regDate = new Timestamp(Calendar.getInstance().getTimeInMillis());
		this.user = user;
	}

	public Long getConfirmationId() {
		return confirmationId;
	}

	public void setConfirmationId(Long confirmationId) {
		this.confirmationId = confirmationId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	
}
