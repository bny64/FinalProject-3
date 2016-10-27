package service;

import java.util.List;

import dto.Category;

public interface CategoryService {
	public List<Category> selectAllCategory();
	public List<Category> selectAllCategoryByPaging(int pageNo);
	public List<Category> searchByCategoryName(int pageNo, String searchStr);
	public int insertCategory(String categoryName);
}
