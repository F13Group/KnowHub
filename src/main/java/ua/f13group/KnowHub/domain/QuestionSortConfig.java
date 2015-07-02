package ua.f13group.KnowHub.domain;

public enum QuestionSortConfig {
	QUESTION("Question","value"), 
	DATE("Date", "load_date"), 
	FREQUENCY("Frequently asked", "rating");
	
	private final String name;
	private final String dbName;
	
	private QuestionSortConfig(String s, String db_name) {
		name = s;
		dbName = db_name;
	}
	
	public String toString() {
		return name;
	}

}
