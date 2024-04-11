package org.zerock.service.manufacturing;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.manufacturing.fileVO;
import org.zerock.domain.manufacturing.recipeStandardVO;
import org.zerock.domain.manufacturing.recipeVO;
import org.zerock.mapper.manufacturing.recipeMapper;
import org.zerock.mapper.manufacturing.fileMapper;
import org.zerock.mapper.manufacturing.recipeStandardMapper;

import java.util.List;
@Log4j
@Service
public class manufacturingRecipeServiceImpl implements manufacturingRecipeService {
    @Autowired
    private recipeMapper mapper;

    @Autowired
    private fileMapper fileMapper;

    @Autowired
    private recipeStandardMapper standardMapper;

    @Override
    public List<recipeVO> getRecipeList(){
        return mapper.recipeList();
    }

    @Override
    public boolean insertRecipeAndFile(recipeVO recipe, fileVO file) {
        try {
            int recipeCount = mapper.insertRecipe(recipe);
            fileMapper.insertFile(file);
            log.info("레시피등록개수" + recipeCount);
            if(recipeCount==0){
                return false; // 데이터 삽입 실패
            }

            return true; // 데이터 삽입 성공
        } catch (Exception e) {
            e.printStackTrace();
            return false; // 데이터 삽입 실패
        }
    }
    @Override
    public int insertRecipe(recipeVO recipe) {
        return mapper.insertRecipe(recipe);
    }

    @Override
    public String selectChickenPhoto(int recipe_Id) {
        return fileMapper.selectChickenPhoto(recipe_Id);
    }

    @Override
    public int insertRecipeStandardList(List<recipeStandardVO> recipeStandardList) {
        return standardMapper.insertRecipeStandardList(recipeStandardList);
    }


}
