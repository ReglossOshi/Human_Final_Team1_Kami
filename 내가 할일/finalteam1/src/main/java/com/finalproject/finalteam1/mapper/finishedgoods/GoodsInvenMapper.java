package com.finalproject.finalteam1.mapper.finishedgoods;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;
import com.finalproject.finalteam1.domain.finishedgoods.GoodsInvenVO;
import com.finalproject.finalteam1.domain.paging.PagingVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsInvenMapper {
    public List<FinishedGoodsVO> readyGoods();

    public List<GoodsInvenVO> invenModalTable(@Param("paging")PagingVO pagingVO, @Param("inven") GoodsInvenVO goodsInvenVO);

    public List<GoodsInvenVO> divInvenCount(GoodsInvenVO goodsInvenVO);
}
