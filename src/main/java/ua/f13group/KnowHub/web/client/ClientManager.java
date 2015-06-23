package ua.f13group.KnowHub.web.client;

public interface ClientManager {
	
	void setCurrentPage(int currentPage);
	
	void setPageSize(int pageSize);
	
	void setPageAmount(int pageAmount);
	
	int getCurrentPage();

	int getPageSize();

	int getPageAmount();

}
