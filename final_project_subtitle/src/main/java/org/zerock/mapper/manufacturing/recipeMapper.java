package org.zerock.mapper.manufacturing;

import org.zerock.domain.manufacturing.recipeVO;

import java.util.List;

public interface recipeMapper {
    List<recipeVO> recipeList() ;

    int insertRecipe(recipeVO recipe);

    recipeVO selectAllRecipeInfoForUpdate(int recipe_Id);

    int updateRecipe(int recipe_Id,
                     String recipe_Name);
    int deleteRecipe(int recipe_Id);
}
