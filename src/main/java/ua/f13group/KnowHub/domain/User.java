/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.f13group.KnowHub.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author amd
 */
@Entity
@Table(name = "users")
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findByUserId", query = "SELECT u FROM User u WHERE u.userId = :userId"),
    @NamedQuery(name = "User.findByLogin", query = "SELECT u FROM User u WHERE u.login = :login"),
    @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password"),
    @NamedQuery(name = "User.findByEnabled", query = "SELECT u FROM User u WHERE u.enabled = :enabled")
    /*@NamedQuery(name = "User.findByLink", query = "SELECT u FROM User u WHERE u.link = :link")*/
})
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long userId;
    
    @NotNull
    @Size(min = 2, max = 50, message = "Please enter your email")
    @Column(name = "login", unique = true)
    private String login;
    
    @NotNull
    @Size(min = 2, max = 64, message = "Please enter your password")
    @Column(name = "password")
    private String password;
    
    @Size(min = 1, max = 64)
    @Transient
    private String password2;
   
    @Transient
    private String firstname;
    
    @Transient
    private String lastname;
    
    @NotNull
    @Column(name = "enabled")
    private boolean enabled = true;
    
    
    @Column(name = "confirmed")
    private boolean confirmed = false;

    @OneToMany(mappedBy = "user_id")
    private List<Comment> comments;

    public User() {
    }

    public User(Long userId) {
        this.userId = userId;
    }

    public User(Long userId, String login, String password, boolean enabled) {
        this.userId = userId;
        this.login = login;
        this.password = password;
        this.enabled = enabled;
    }

    public String getFirstname(){
    	if(firstname == null){
    		firstname = login.substring(0, login.indexOf('_'));
    	}
    	return firstname;
    }
    
    public String getLastname(){
    	if(lastname == null){
    		login.substring(login.indexOf('_')+1, login.indexOf('@'));
    	}
    	return lastname;
    }
    
    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }
    
    
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public boolean isConfirmed() {
		return confirmed;
	}

	public void setConfirmed(boolean confirmed) {
		this.confirmed = confirmed;
	}


	@Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ua.f13group.KnowHub.domain.Users[ userId=" + userId + " ]";
    }
    
}
