package com.finalproject.finalteam1.mapper.finishedgoods;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;

import java.util.List;

public interface FinishedGoodsMapper {
    public List<FinishedGoodsVO> getGoodsList();
    public List<FinishedGoodsVO> getRecipeList();
    public void goodsInsert(FinishedGoodsVO goods);
}
