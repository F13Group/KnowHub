package ua.f13group.KnowHub.domain;

public enum QuestionSortConfig {
	QUESTION("Question"),
	CATEGORY("Category"),
	DATE("Date"), 
	FREQUENCY("Frequently asked");
	
	private final String name;
	
	private QuestionSortConfig(String s) {
		name = s;
	}
	
	public String toString() {
		return name;
	}

}
