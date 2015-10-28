package ua.f13group.KnowHub.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "questions")
@NamedQueries({
		@NamedQuery(name = "Question.getPagesCount", 
			query = "SELECT Count(q) FROM Question q "),		
		@NamedQuery(name = "Question.getPagesCountWithCategory", 
			query = "SELECT Count(q) FROM Question q WHERE q.category.id = :category"),
		
		//@NamedQuery(name = "Question.findByCategory", 
		//	query = "SELECT q FROM Question q INNER JOIN q.categories c WHERE c.id IN (:category)"),
		@NamedQuery(name = "Question.findAll", query = "SELECT q FROM Question q ORDER BY q.loadDate DESC"),
		// @NamedQuery(name = "Question.getPage", query =
		// "SELECT q FROM Question q"),
		// @NamedQuery(name = "Question.getPagesCount", query =
		// "SELECT Count(q) FROM Question q"),
		//@NamedQuery(name = "Question.findByCategory", query = "SELECT q FROM Question q INNER JOIN q.categories c WHERE c.id IN (:category) ORDER BY q.loadDate DESC")

		@NamedQuery(name = "Question.findByCategory", 
			query = "SELECT q FROM Question q WHERE q.category.id = :category ORDER BY q.loadDate DESC")
})
public class Question implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "question_id")
	Long id;
	String value;
	@Column(name = "load_date")
	Timestamp loadDate;
//	Long rating;
//	@Column(name = "user_id")
//	Long userId;

	//@ManyToMany(fetch = FetchType.EAGER)
	// @LazyCollection(LazyCollectionOption.FALSE)
	//@JoinTable(name = "question_categories", joinColumns = { @JoinColumn(name = "question_id") }, inverseJoinColumns = { @JoinColumn(name = "category_id") })
	//private List<Category> categories;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "question_tags", joinColumns = { @JoinColumn(name = "question_id") }, inverseJoinColumns = { @JoinColumn(name = "tag_id") })
	private List<Tag> tags;

//	@ManyToMany(fetch = FetchType.EAGER)
//	@JoinTable(name = "ratings", joinColumns = { @JoinColumn(name = "question_id") }, inverseJoinColumns = {
//			@JoinColumn(name = "user_id") })
//	private List<User> users;

	public Question() {
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

//	public Long getRating() {
//		return rating;
//	}
//
//	public void setRating(Long rating) {
//		this.rating = rating;
//	}
//
//	public Long getUserId() {
//		return userId;
//	}
//
//	public void setUserId(Long userId) {
//		this.userId = userId;
//	}

//	public List<Category> getCategories() {
//		return categories;
//	}
//
//	public void setCategories(List<Category> categories) {
//		this.categories = categories;
//	}
	public Category getCategory(){
		return category;
	}
	
	public void setCategory(Category category){
		this.category = category;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}


}