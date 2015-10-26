package ua.f13group.KnowHub.domain;

public enum QuestionSortConfig {
	DATE("Date", "loadDate"), 
	CATEGORY("Category","value"), 
	RATING("Frequently asked", "rating"),
	//TODO: "rating" for Bookmark should be changed on DB field name in table Questions responsible for bookmark 
	BOOKMARK("My Bookmarks", "rating");
	
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
