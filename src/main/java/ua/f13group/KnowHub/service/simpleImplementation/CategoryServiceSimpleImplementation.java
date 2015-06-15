package ua.f13group.KnowHub.service.simpleImplementation;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.service.CategoryService;

@Service
public class CategoryServiceSimpleImplementation implements CategoryService {

	@Override
	public List<Category> findAll() {
	ArrayList<Category> mock = new ArrayList<Category>();
	Category cat = new Category();
	cat.setId(new Long(1));
	cat.setPostId(new Long(1));
	cat.setValue("Category1");
	
	Category cat2 = new Category();
	cat2.setId(2l);
	cat2.setPostId(2l);
	cat2.setValue("Category2");
	
	mock.add(cat);
	mock.add(cat2);
	
	return mock;
}

}
