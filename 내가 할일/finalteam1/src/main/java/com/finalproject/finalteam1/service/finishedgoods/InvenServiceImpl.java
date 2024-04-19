package com.finalproject.finalteam1.service.finishedgoods;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;
import com.finalproject.finalteam1.domain.finishedgoods.GoodsInvenVO;
import com.finalproject.finalteam1.domain.paging.PagingVO;
import com.finalproject.finalteam1.mapper.finishedgoods.GoodsInvenMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InvenServiceImpl implements InvenService{
    @Autowired
    private GoodsInvenMapper goodsInvenMapper;

    @Override
    public List<FinishedGoodsVO> goodsList() {
        return goodsInvenMapper.readyGoods();
    }

    @Override
    public List<GoodsInvenVO> availableStorage(PagingVO pagingVO, GoodsInvenVO goodsInvenVO) {
        return goodsInvenMapper.invenModalTable(pagingVO, goodsInvenVO);
    }

    @Override
    public List<GoodsInvenVO> divInvenCount(GoodsInvenVO goodsInvenVO) {
        return goodsInvenMapper.divInvenCount(goodsInvenVO);
    }
}
