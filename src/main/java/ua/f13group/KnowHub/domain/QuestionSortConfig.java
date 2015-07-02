package ua.f13group.KnowHub.domain;

public enum QuestionSortConfig {
	QUESTION("Question"), 
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
