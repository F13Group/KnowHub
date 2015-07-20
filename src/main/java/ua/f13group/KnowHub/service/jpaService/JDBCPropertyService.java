package ua.f13group.KnowHub.service.jpaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.f13group.KnowHub.repository.PropertyRepository;
import ua.f13group.KnowHub.service.PropertyService;

@Service(value="propertyService")
public class JDBCPropertyService implements PropertyService {
	@Autowired
	PropertyRepository propertyRepository;

	@Override
	public String getProperty(String key) {
		return propertyRepository.getProperty(key);
		
	}

}
