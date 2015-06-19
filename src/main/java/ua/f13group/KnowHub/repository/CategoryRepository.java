package ua.f13group.KnowHub.repository;

import java.util.List;
import ua.f13group.KnowHub.domain.Category;

public interface CategoryRepository {
	public List<Category> findAll();
	
}
