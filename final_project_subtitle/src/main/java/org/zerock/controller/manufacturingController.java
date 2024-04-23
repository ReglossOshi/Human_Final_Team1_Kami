package org.zerock.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.manufacturingService;

@Controller
@Log4j
@RequestMapping("/manufacturing")
public class manufacturingController {
    private manufacturingService service;

    @GetMapping("/BomList")
    public String BomList(){
        return "manufacturing/BomList";
    }



}
