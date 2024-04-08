package com.finalproject.finalteam1.service.finishedgoods;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;
import com.finalproject.finalteam1.mapper.finishedgoods.FinishedGoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FinishedGoodsServiceImpl implements FinishedGoodsService{

    @Autowired
    private FinishedGoodsMapper finishedGoodsMapper;
    @Override
    public List<FinishedGoodsVO> insertGoods(){
        List<FinishedGoodsVO> goods = finishedGoodsMapper.getGoodsList();
        return goods;
    }
}
