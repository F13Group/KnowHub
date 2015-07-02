package ua.f13group.KnowHub.web.dto;

public class QuestionMetadata {
	private int pageCount;
	private int recordsCount;

	public QuestionMetadata(int pagesCount, int recordsCount) {
		this.pageCount = pagesCount;
		this.recordsCount = recordsCount;
	}

	public int getRecordsCount() {
		return recordsCount;
	}

	public void setRecordsCount(int recordsCount) {
		this.recordsCount = recordsCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

}
