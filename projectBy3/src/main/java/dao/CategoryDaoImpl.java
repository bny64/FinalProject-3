package dao;

import java.util.List;

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

}
