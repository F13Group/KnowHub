package ua.f13group.KnowHub.domain;

public enum QuestionSortConfig {
	QUESTION("Question"), 
	DATE("Date"), 
	FREQUENCY("Frequency");
	
	private final String name;
	
	private QuestionSortConfig(String s) {
		name = s;
	}

	
	public String toString() {
		return name;
	}

}
