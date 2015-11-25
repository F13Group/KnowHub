package ua.f13group.KnowHub.domain;

public enum QuestionSortConfig {
	DATE("Date", "loadDate", "q.load_date"), 
	CATEGORY("Category", "value", "value"), 
	RATING("Frequently asked", "rating", "rating"),
	//TODO: "rating" for Bookmark should be changed on DB field name in table Questions responsible for bookmark 
	BOOKMARK("My Bookmarks", "bookmarked", "bookmarked");
	
	private final String name;
	public final String dbName;
	public final String nativeName;
	
	private QuestionSortConfig(String s, String db_name, String native_name) {
		name = s;
		dbName = db_name;
		nativeName = native_name;
	}
	
	public String toString() {
		return name;
	}

}
