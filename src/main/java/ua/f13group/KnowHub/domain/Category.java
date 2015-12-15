package ua.f13group.KnowHub.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "categories")
@NamedQueries({ @NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c ORDER BY replace(c.value,'.','a')") })
public class Category implements Comparable<Category> {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "category_id")
	Long id;
	@Column(name = "value")
	String value;
	@Column(name = "short_value")
	String shortValue;

	public Category() {
	}

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
	
	public String getShortValue() {
		return shortValue;
	}

	public void setShortValue(String shortValue) {
		this.shortValue = shortValue;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((value == null) ? 0 : value.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (!(obj instanceof Category)) {
			return false;
		}
		Category other = (Category) obj;
		if (value == null) {
			if (other.value != null) {
				return false;
			}
		} else if (!value.equals(other.value)) {
			return false;
		}
		return true;
	}

	@Override
	public int compareTo(Category o) {
		if (this.value.compareTo(o.value) > 0) {
			return 1;
		}
		if (this.value.compareTo(o.value) < 0) {
			return -1;
		}

		return 0;
	}
}
