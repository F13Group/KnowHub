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
	cat.setValue("All");
	
	Category cat2 = new Category();
	cat2.setId(2l);
	cat2.setPostId(2l);
	cat2.setValue("Java");
	
	Category cat3 = new Category();
	cat3.setId(3l);
	cat3.setPostId(3l);
	cat3.setValue(".NET");
	
	Category cat4 = new Category();
	cat4.setId(4l);
	cat4.setPostId(4l);
	cat4.setValue("Bisiness intelligence");
	
	Category cat5 = new Category();
	cat5.setId(5l);
	cat5.setPostId(5l);
	cat5.setValue("Functional testing");
	
	mock.add(cat);
	mock.add(cat2);
	mock.add(cat3);
	mock.add(cat4);
	mock.add(cat5);
	
	return mock;
}

}
