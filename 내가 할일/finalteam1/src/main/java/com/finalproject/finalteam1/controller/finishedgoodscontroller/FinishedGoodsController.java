package com.finalproject.finalteam1.controller.finishedgoodscontroller;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;
import com.finalproject.finalteam1.service.finishedgoods.FinishedGoodsService;
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
        return "/finishedgoods/goodsmanagement";
    }

}
