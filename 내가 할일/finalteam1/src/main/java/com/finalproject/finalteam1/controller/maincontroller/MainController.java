package com.finalproject.finalteam1.controller.maincontroller;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;
import com.finalproject.finalteam1.service.finishedgoods.FinishedGoodsService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/main")
@AllArgsConstructor
public class MainController {
    private FinishedGoodsService service;

    @GetMapping
    public String index() {
        return "/admin/index";
    }

    @GetMapping("/test")
    public String test(Model model) {
//        List<FinishedGoodsVO> goodslist =service.selectGoods();
        List<FinishedGoodsVO> recipelist =service.selectRecipe();
//        model.addAttribute("goodslist",goodslist);
        model.addAttribute("recipelist",recipelist);
        return "/admin/test";
    }



    @GetMapping("/test2")
    public String test2(Model model) {
//        List<FinishedGoodsVO> goodslist =service.selectGoods();
//        model.addAttribute("goodslist",goodslist);
        return "/admin/test2";
    }
}
