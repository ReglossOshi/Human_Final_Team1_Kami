package org.zerock.service.manufacturing;

import org.zerock.domain.manufacturing.fileVO;
import org.zerock.domain.manufacturing.recipeStandardVO;
import org.zerock.domain.manufacturing.recipeVO;

import java.util.List;

public interface manufacturingService {
    public List<recipeVO> getRecipeList();

    public boolean insertRecipeAndFile(recipeVO vo, fileVO file);

    public int insertRecipe(recipeVO vo);

    public String selectChickenPhoto(int recipe_Id);
    public int insertRecipeStandardList(List<recipeStandardVO> recipeStandardList);
}
