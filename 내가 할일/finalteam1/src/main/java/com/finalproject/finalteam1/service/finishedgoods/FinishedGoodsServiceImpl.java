package com.finalproject.finalteam1.service.finishedgoods;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;
import com.finalproject.finalteam1.domain.paging.PagingVO;
import com.finalproject.finalteam1.mapper.finishedgoods.FinishedGoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FinishedGoodsServiceImpl implements FinishedGoodsService{

    @Autowired
    private FinishedGoodsMapper finishedGoodsMapper;
    @Override
    public List<FinishedGoodsVO> selectGoods(PagingVO paging, FinishedGoodsVO finishedGoodsVO){
        List<FinishedGoodsVO> goods = finishedGoodsMapper.getGoodsList(paging,finishedGoodsVO);


        return goods;
    }

    @Override
    public List<FinishedGoodsVO> selectRecipe() {
        return finishedGoodsMapper.getRecipeList();
    }

    @Override
    public int updateGoods(FinishedGoodsVO goods) {
        return finishedGoodsMapper.goodsUpdate(goods);
    }

    @Override
    public void deleteGoods() {
        finishedGoodsMapper.goodsDelete();
    }

    @Override
    public int maxCount(FinishedGoodsVO finishedGoodsVO) {
        return finishedGoodsMapper.maxpageCount(finishedGoodsVO);
    }

    @Override
    public void insertGoods(FinishedGoodsVO finishedGoodsVO) {
        finishedGoodsMapper.goodsAdd(finishedGoodsVO);
    }

    @Override
    public List<FinishedGoodsVO> recipeNum() {
        return finishedGoodsMapper.recipeId();
    }
}
