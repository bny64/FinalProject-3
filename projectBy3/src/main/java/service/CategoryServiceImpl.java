package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CategoryDao;
import dto.Category;

@Service
public class CategoryServiceImpl implements CategoryService {
	static Logger logger = LoggerFactory.getLogger(CategoryServiceImpl.class);
	
	@Autowired
	CategoryDao categoryDao;
	
	@Override
	public List<Category> selectAllCategory() {
		logger.trace("CategoryServiceImpl - selectAllCategory() 동작");
		return categoryDao.selectAllCategory();
	}

}
