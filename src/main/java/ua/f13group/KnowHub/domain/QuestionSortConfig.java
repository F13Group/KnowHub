package ua.f13group.KnowHub.domain;

public enum QuestionSortConfig {
	DATE("Date", "loadDate"), 
	CATEGORY("Category","category"), 
	RATING("Frequently asked", "rating");
	
	private final String name;
	public final String dbName;
	
	private QuestionSortConfig(String s, String db_name) {
		name = s;
		dbName = db_name;
	}
	
	public String toString() {
		return name;
	}

}
