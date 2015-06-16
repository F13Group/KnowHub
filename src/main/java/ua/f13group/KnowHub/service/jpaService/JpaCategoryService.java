package ua.f13group.KnowHub.service.jpaService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.repository.CategoryRepository;
import ua.f13group.KnowHub.service.CategoryService;


@Service(value = "categoryService")
public class JpaCategoryService implements CategoryService {

	@Autowired
	private CategoryRepository categoryRep;

	public List<Category> findAll() {
		return categoryRep.findAll();

	}

}
