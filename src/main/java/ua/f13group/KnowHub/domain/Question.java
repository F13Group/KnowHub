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
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.EntityResult;
import javax.persistence.FieldResult;
import javax.persistence.ColumnResult;

@Entity
@Table(name = "questions")
@NamedQueries({ @NamedQuery(name = "Question.getPagesCount", query = "SELECT Count(q) FROM Question q "),
		@NamedQuery(name = "Question.getPagesCountWithCategory", query = "SELECT Count(q) FROM Question q WHERE q.category.id = :category"),
		@NamedQuery(name = "Question.findByCategory", query = "SELECT q FROM Question q WHERE q.category.id = :category ORDER BY q.loadDate DESC") })
@NamedNativeQueries({
		@NamedNativeQuery(name = "Question.findAllWithRatingIsAskedAndIsBookmarked", query = "SELECT q.question_id, q.value, q.load_date, q.category_id, count (r.user_id) as rating,"
				+ " (SELECT count(r.rating_id)>0 as asked FROM ratings r WHERE r.user_id = :userId and r.question_id = q.question_id),"
				+ " (SELECT count(b.bookmark_id)>0 as bookmarked FROM bookmarks b WHERE b.user_id = :userId and b.question_id = q.question_id)"
				+ " FROM ratings r RIGHT JOIN questions q ON r.question_id = q.question_id"
				+ " GROUP BY q.question_id ORDER BY :orderBy", resultSetMapping = "QuestionMapping"),
		@NamedNativeQuery(name = "Question.findByCategoryWithRatingIsAskedAndIsBookmarked", query = "SELECT q.question_id, q.value, q.load_date, q.category_id, count (r.user_id) as rating,"
				+ " (SELECT count(r.rating_id)>0 as asked FROM ratings r WHERE r.user_id = :userId and r.question_id = q.question_id),"
				+ " (SELECT count(b.bookmark_id)>0 as bookmarked FROM bookmarks b WHERE b.user_id = :userId and b.question_id = q.question_id)"
				+ " FROM ratings r RIGHT JOIN questions q ON r.question_id = q.question_id WHERE q.category_id = :categoryId"
				+ " GROUP BY q.question_id ORDER BY :orderBy", resultSetMapping = "QuestionMapping"),
		@NamedNativeQuery(name = "Question.findByUserBookmarkedOnly", query = "SELECT q.question_id, q.value, q.load_date, c.value, count(r.user_id) as rating"
				+ "FROM ratings r" + "JOIN questions q ON q.question_id = r.question_id"
				+ "JOIN categories c ON c.category_id = q.category_id"
				+ "JOIN bookmarks b ON q.question_id = b.question_id" + "WHERE b.user_id = :user_id"
				+ "GROUP BY q.question_id, c.value ORDER BY :orderBy", resultSetMapping = "QuestionMapping") })
@SqlResultSetMapping(name = "QuestionMapping", entities = @EntityResult(entityClass = Question.class, fields = {
		@FieldResult(name = "id", column = "question_id"), @FieldResult(name = "value", column = "value"),
		@FieldResult(name = "description", column = "description"), @FieldResult(name = "views", column = "views"),
		@FieldResult(name = "loadDate", column = "load_date"), @FieldResult(name = "user", column = "user_id"),
		@FieldResult(name = "category", column = "category_id") }) , columns = {
				@ColumnResult(name = "rating", type = Long.class), @ColumnResult(name = "asked", type = Boolean.class),
				@ColumnResult(name = "bookmarked", type = Boolean.class) })
public class Question implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "question_id")
	Long id;

	@Column(name = "value", length = 140)
	String value; // title of the question

	@Column(name = "description", columnDefinition = "TEXT")
	String description; // full text of question

	@Column(name = "views")
	Long views;

	@Column(name = "load_date")
	Timestamp loadDate;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "question_tags", joinColumns = { @JoinColumn(name = "question_id") }, inverseJoinColumns = {
			@JoinColumn(name = "tag_id") })
	private List<Tag> tags;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getViews() {
		return views;
	}

	public void setViews(Long views) {
		this.views = views;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public static String getFindAllWithRatingIsAskedAndIsBookmarkedQueryString(Category category,
			QuestionSortConfig orderBy, boolean isSortedAscending) {

		String sqlQueryString = "SELECT q.question_id, q.value, q.description, q.views, q.load_date, q.user_id, q.category_id, count (r.user_id) as rating,"
				+ " (SELECT count(r.rating_id)>0 as asked FROM ratings r WHERE r.user_id = :userId and r.question_id = q.question_id),"
				+ " (SELECT count(b.bookmark_id)>0 as bookmarked FROM bookmarks b WHERE b.user_id = :userId and b.question_id = q.question_id)"
				+ " FROM ratings r RIGHT JOIN questions q ON r.question_id = q.question_id"
				+ " JOIN categories c ON c.category_id = q.category_id";

		if (category != null) {
			sqlQueryString += " WHERE q.category_id = :categoryId";
		}

		sqlQueryString += " GROUP BY q.question_id, c.value ORDER BY";

		switch (orderBy) {
		case CATEGORY:
			sqlQueryString += " c.value";
			break;
		case DATE:
			sqlQueryString += " q.load_date";
			break;
		case RATING:
			sqlQueryString += " rating";
			break;
		default:
			sqlQueryString += " q.value";
			break;
		}

		if (isSortedAscending) {
			sqlQueryString += " ASC";
		} else {
			sqlQueryString += " DESC";
		}

		return sqlQueryString;
	}
}