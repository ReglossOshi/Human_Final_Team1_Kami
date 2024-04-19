package com.finalproject.finalteam1.controller.finishedgoodscontroller;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;
import com.finalproject.finalteam1.domain.finishedgoods.GoodsInvenVO;
import com.finalproject.finalteam1.service.finishedgoods.FinishedGoodsService;
import com.finalproject.finalteam1.service.finishedgoods.InvenService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/finishedgoods")
@AllArgsConstructor
public class FinishedGoodsController {
    private FinishedGoodsService service;
    private InvenService invenService;
    @GetMapping("/goodsmanagement")
    public String managementpage(Model model){
        List<FinishedGoodsVO> recipelist =service.selectRecipe();
        model.addAttribute("recipelist",recipelist);

        List<FinishedGoodsVO> recipeNum = service.recipeNum();
        for(int i=0;i<recipeNum.size();i++){
            service.insertGoods(recipeNum.get(i));
            System.out.println(1+"번 실행 됨");
        }
        service.deleteGoods();

        GoodsInvenVO goodsInvenVO = new GoodsInvenVO();
        goodsInvenVO.setFinishedgoodsinventory_division("입고");
        List<GoodsInvenVO> innerCount = invenService.divInvenCount(goodsInvenVO);
        goodsInvenVO.setFinishedgoodsinventory_division("출고");
        List<GoodsInvenVO> outterCount = invenService.divInvenCount(goodsInvenVO);
        int outterSize=0;
        if(outterCount != null){
            outterSize = outterCount.size();
        }

//        for(int i=0;i<innerCount.size();i++){
//            int innerNum1 = innerCount.get(i).getFinishedgoodsinventory_goods_id();
//            for(int j=0;j<i;j++){
//                int innerNum2 = innerCount.get(j).getFinishedgoodsinventory_goods_id();
//                if(innerNum1==innerNum2){
//                    System.out.println("중복 값"+innerNum1);
//                }
//            }
//        }




        return "/finishedgoods/goodsmanagement";
    }

}
