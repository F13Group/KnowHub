package ua.f13group.KnowHub.JpaService;

import org.springframework.beans.factory.annotation.Autowired;

import ua.f13group.KnowHub.service.CategoryService;

public class JpaCategoryService implements CategoryService {

	@Autowired
	private CategoryRepository categoryRep;
	
	public List<Category> findAll(){
		return categoryRep.findAll();
		
	}
	
}
