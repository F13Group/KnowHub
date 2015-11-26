package ua.f13group.KnowHub.web.dto;

import java.sql.Timestamp;
import java.util.List;
import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Tag;
import ua.f13group.KnowHub.domain.User;

public class QuestionFrequentAskedDTO {	
	private Long id;
	private String value;
	private Timestamp loadDate;
	private Category category;
	private List<Tag> tags;
	private Long rating;
	private Boolean isAsked;
	private Boolean isBookmarked;
	private User user; 
	private Long views;
	private String description;
	
	public QuestionFrequentAskedDTO(			
			Long id,
			String value,
			Timestamp loadDate,
			Category category,
			List<Tag> tags,
			Long rating,
			Boolean isAsked,
			Boolean isBookmarked,
			User user,
			Long views,
			String description) {
		
		this.id = id;
		this.value = value;
		this.loadDate = loadDate;
		this.category = category;
		this.tags = tags;
		this.rating = rating;
		this.isAsked = isAsked;
		this.isBookmarked = isBookmarked;
		this.user = user;
		this.views = views;
		this.description = description;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Timestamp getLoadDate() {
		return loadDate;
	}

	public void setLoadDate(Timestamp loadDate) {
		this.loadDate = loadDate;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public Long getRating() {
		return rating;
	}

	public void setRating(Long rating) {
		this.rating = rating;
	}

	public Boolean getIsAsked() {
		return isAsked;
	}

	public void setIsAsked(Boolean isAsked) {
		this.isAsked = isAsked;
	}

	public Boolean getIsBookmarked() {
		return isBookmarked;
	}

	public void setIsBookmarked(Boolean isBookmarked) {
		this.isBookmarked = isBookmarked;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	public User getUser(){
		return user;
	}
	
	public void setViews(Long views) {
		this.views = views;
	}
	
	public Long getViews(){
		return views;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription(){
		return description;
	}
}
