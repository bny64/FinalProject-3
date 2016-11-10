package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao{
	static Logger logger = LoggerFactory.getLogger(CategoryDaoImpl.class);
	final static String BOARD_NS = "CategoryMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<Category> selectAllCategory() {
		logger.trace("CategoryDaoImpl - selectAllCategory 동작");
		String stmt = BOARD_NS + "selectAllCategory";
		return template.selectList(stmt);
	}

	@Override
	public List<Category> selectAllCategoryByPaging(Map<String, Object> filter) {
		logger.trace("CategoryDaoImpl - selectAllCategoryByPaging 동작");
		String stmt = BOARD_NS + "selectAllCategoryByPaging";
		return template.selectList(stmt,filter);

	}

	@Override
	public List<Category> searchByCategoryName(Map<String, Object> filter) {
		logger.trace("CategoryDaoImpl - searchByCategoryName 동작");
		String stmt = BOARD_NS + "searchByCategoryName";
		return template.selectList(stmt,filter);
	}

	@Override
	public int insertCategory(Category category) {
		logger.trace("CategoryDaoImpl - insertCategory 동작");
		String stmt = BOARD_NS + "insertCategory";
		return template.insert(stmt, category);
	}

	@Override
	public List<Category> selectAllCategoryByUser(int userNo) {
		logger.trace("CategoryDaoImpl - selectAllCategoryByUser 동작");
		String stmt = BOARD_NS + "selectAllCategoryByUser";
		return template.selectList(stmt,userNo);
	}

}
