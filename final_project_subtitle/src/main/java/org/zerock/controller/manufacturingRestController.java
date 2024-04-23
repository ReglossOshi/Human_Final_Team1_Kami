package org.zerock.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.service.manufacturingService;

@RestController
@RequestMapping("/manufacturingController")
@Log4j
public class manufacturingRestController {
    private manufacturingService service;
}
