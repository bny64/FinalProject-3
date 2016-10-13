package dao;
import java.util.List;
import java.util.Map;

import dto.Category;

public interface CategoryDao {
	public List<Category> selectAllCategory();
	public List<Category> selectAllCategoryByPaging(Map<String, Object> filter);
	public List<Category> searchByCategoryName(Map<String, Object> filter);
	public int insertCategory(Category category);
}
