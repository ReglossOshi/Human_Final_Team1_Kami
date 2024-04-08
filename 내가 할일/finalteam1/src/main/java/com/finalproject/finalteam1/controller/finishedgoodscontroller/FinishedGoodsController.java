package com.finalproject.finalteam1.controller.finishedgoodscontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/finishedgoods")
public class FinishedGoodsController {
    @GetMapping("/goodsmanagement")
    public String managementpage(){
        return "/finishedgoods/goodsmanagement";
    }
}
