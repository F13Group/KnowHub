package ua.f13group.KnowHub.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "categories")
@NamedQueries({
    @NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c ORDER BY c.value")
})
public class Category {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="category_id")
	Long id;
	String value;
	
	//@ManyToMany(mappedBy="categories",fetch=FetchType.LAZY)
	//@LazyCollection(LazyCollectionOption.TRUE)
	//@JsonIgnore
	//private List<Question> questions;
	
	public Category() {}

	public Category(Long categoryId) {
		this.id = categoryId;
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

	@Override
	public String toString() {
		return "Category [id=" + id + ", value=" + value + "]";
	}

	public void setValue(String value) {
		this.value = value;
	}

	//public List<Question> getQuestions() {
	//	return questions;
	//}

	//public void setQuestions(List<Question> questions) {
	//	this.questions = questions;
	//}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((value == null) ? 0 : value.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Category))
			return false;
		Category other = (Category) obj;
		if (value == null) {
			if (other.value != null)
				return false;
		} else if (!value.equals(other.value))
			return false;
		return true;
	}
	
	
}
