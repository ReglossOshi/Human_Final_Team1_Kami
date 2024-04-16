package com.finalproject.finalteam1.service.finishedgoods;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;
import com.finalproject.finalteam1.domain.paging.PagingVO;

import java.util.List;

public interface FinishedGoodsService {
    public List<FinishedGoodsVO> selectGoods(PagingVO paging, FinishedGoodsVO finishedGoodsVO);

    public List<FinishedGoodsVO> selectRecipe();

    public int updateGoods(FinishedGoodsVO goods);

    public int maxCount(FinishedGoodsVO finishedGoodsVO);

    public void deleteGoods(FinishedGoodsVO finishedGoodsVO);
}
