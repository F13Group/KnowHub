package ua.f13group.KnowHub.domain;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "tags")
public class Tag {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="tag_id")
	Long id;
	String value;
	//@ManyToMany(mappedBy = "tags")
	//private List<Question> questions;

	public Tag() {
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
}
