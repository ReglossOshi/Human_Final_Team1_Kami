package com.finalproject.finalteam1.mapper.finishedgoods;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;
import com.finalproject.finalteam1.domain.paging.PagingVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FinishedGoodsMapper {
    public List<FinishedGoodsVO> getGoodsList(@Param("paging") PagingVO paging, @Param("goods") FinishedGoodsVO finishedGoodsVO);
    public List<FinishedGoodsVO> getRecipeList();
    public int goodsInsert(FinishedGoodsVO goods);

    public int maxpageCount(@Param("goods") FinishedGoodsVO finishedGoodsVO);
}
