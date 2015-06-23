package ua.f13group.KnowHub.web.client;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;


@Component("clientManager")
@Scope(value = "session", proxyMode = ScopedProxyMode.INTERFACES)
public class ClientManagerImpl implements ClientManager {

	int currentPage=1;
	int PageSize=10;
	int pageAmount=1;

	@Override
	public int getCurrentPage() {
		return currentPage;
	}

	@Override
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@Override
	public int getPageSize() {
		return PageSize;
	}

	@Override
	public void setPageSize(int pageSize) {
		PageSize = pageSize;
	}

	@Override
	public int getPageAmount() {
		return pageAmount;
	}

	@Override
	public void setPageAmount(int pageAmount) {
		this.pageAmount = pageAmount;
	}

}
