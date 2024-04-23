package org.zerock.mapper.manufacturing;

import org.zerock.domain.manufacturing.PagingVO;
import org.zerock.domain.manufacturing.recipeStandardVO;

import java.util.List;

public interface recipeStandardMapper {

    // 레시피 기준 정보입력
    int insertRecipeStandardList(List<recipeStandardVO> recipeStandardList);
    List<recipeStandardVO> selectRecipeStandardInfoForUpdate(PagingVO paging, int recipe_Id);
    int autoUpdateStandardRecipe(int recipe_Id,
                                 String recipe_Name);

    int updateAllStandardRecipe(recipeStandardVO vo);

    int deleteAllStandardRecipe(int standard_Id);

    int deleteStandardRecipe(int recipe_Id);

}
