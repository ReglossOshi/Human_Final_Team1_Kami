package org.zerock.mapper.manufacturing;

import org.zerock.domain.manufacturing.recipeVO;

import java.util.List;

public interface recipeMapper {
    List<recipeVO> recipeList() ;

    int insertRecipe(recipeVO recipe);


}
