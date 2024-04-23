package org.zerock.service.manufacturing;

import org.zerock.domain.manufacturing.PagingVO;
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

    // 사진 눌렀을 때 나오는 모달 박스 안 select 내용(규격 제외) --> 업데이트용
    public recipeVO selectAllRecipeInfoForUpdate(int recipe_Id);

    // 사진 눌렀을 때 나오는 모달 박스 안 select 내용(규격만)--> 업데이트용
    public List<recipeStandardVO> selectRecipeStandardInfoForUpdate(PagingVO paging, int recipe_Id);

    // 사진 눌렀을 때 나오는 모달 박스 안 레시피 정보만 수정
    public int updateRecipe(int recipe_Id,
                            String recipe_Name);

    // 레시피 정보를 수정하면서 standard에 레시피명이 변경
    public int autoUpdateStandardRecipe(int recipe_Id,
                                        String recipe_Name);
    // filerepository의 filename update
    int updateFileRecipe(int recipe_Id,
                         String fileName);

    int updateAllStandardRecipe(recipeStandardVO vo);
    int deleteAllStandardRecipe(int standard_Id);

    String deleteRecipeAndStandard(int recipe_Id);
}
