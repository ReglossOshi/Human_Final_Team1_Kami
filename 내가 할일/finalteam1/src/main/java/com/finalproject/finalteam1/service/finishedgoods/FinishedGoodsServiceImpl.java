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
    public List<FinishedGoodsVO> selectGoods(){
        List<FinishedGoodsVO> goods = finishedGoodsMapper.getGoodsList();
        for(int i=0;i<goods.size();i++){
            if(goods.get(i).getFinishedgoods_quantity()<0){
                goods.get(i).setFinishedgoods_quantity(0);
            }
        }
        return goods;
    }

    @Override
    public List<FinishedGoodsVO> selectRecipe() {
        return finishedGoodsMapper.getRecipeList();
    }
}
