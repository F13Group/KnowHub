package ua.f13group.KnowHub.web.dto;

public class QuestionMetadata {
	private int currentPage;
	private int pageCount;

	public QuestionMetadata(int cp, int pc) {
		currentPage = cp;
		pageCount = pc;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

}
