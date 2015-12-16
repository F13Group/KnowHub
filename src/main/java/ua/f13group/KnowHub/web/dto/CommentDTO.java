package ua.f13group.KnowHub.web.dto;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Comment;
import ua.f13group.KnowHub.domain.Tag;
import ua.f13group.KnowHub.domain.User;

public class CommentDTO {
	private Long id;
	private Date date;
	private String value;
	private boolean isCurrentUserRatedComment; 
	private Comment parentComment;
	private String authorLogin;
	private int positiveRate;
	private int negativeRate;
		
	public int getPositiveRate() {
		return positiveRate;
	}
	public void setPositiveRate(int positiveRate) {
		this.positiveRate = positiveRate;
	}
	public int getNegativeRate() {
		return negativeRate;
	}
	public void setNegativeRate(int negativeRate) {
		this.negativeRate = negativeRate;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public boolean isCurrentUserRatedComment() {
		return isCurrentUserRatedComment;
	}
	public void setCurrentUserRatedComment(boolean isCurrentUserRatedComment) {
		this.isCurrentUserRatedComment = isCurrentUserRatedComment;
	}
	public Comment getParentComment() {
		return parentComment;
	}
	public void setParentComment(Comment parentComment) {
		this.parentComment = parentComment;
	}
	public String getAuthorLogin() {
		return authorLogin;
	}
	public void setAuthorLogin(String authorLogin) {
		this.authorLogin = authorLogin;
	} 
	
	
}
