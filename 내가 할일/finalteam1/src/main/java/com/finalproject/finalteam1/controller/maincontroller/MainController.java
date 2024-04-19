package com.finalproject.finalteam1.controller.maincontroller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
@AllArgsConstructor
public class MainController {

    @GetMapping
    public String index() {
        return "/admin/index";
    }

    @GetMapping("/test")
    public String test(Model model) {
        return "/admin/test";
    }
}
