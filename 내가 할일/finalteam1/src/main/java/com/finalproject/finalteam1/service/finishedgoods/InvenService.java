package com.finalproject.finalteam1.service.finishedgoods;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;
import com.finalproject.finalteam1.domain.finishedgoods.GoodsInvenVO;
import com.finalproject.finalteam1.domain.paging.PagingVO;

import java.util.List;

public interface InvenService {
    public List<FinishedGoodsVO> goodsList();

    public List<GoodsInvenVO> availableStorage(PagingVO pagingVO, GoodsInvenVO goodsInvenVO);

    public List<GoodsInvenVO> divInvenCount(GoodsInvenVO goodsInvenVO);
}
