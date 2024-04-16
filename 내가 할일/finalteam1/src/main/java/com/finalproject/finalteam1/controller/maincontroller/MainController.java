package com.finalproject.finalteam1.controller.maincontroller;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;
import com.finalproject.finalteam1.domain.paging.PagingVO;
import com.finalproject.finalteam1.domain.test.TestVO;
import com.finalproject.finalteam1.service.finishedgoods.FinishedGoodsService;
import com.finalproject.finalteam1.service.test.TestService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/main")
@AllArgsConstructor
public class MainController {
    private TestService testService;

    @GetMapping
    public String index() {
        return "/admin/index";
    }

    @GetMapping("/test")
    public String test(Model model) {
        List<TestVO> getDivList = testService.testDiv();
        model.addAttribute("getDivList",getDivList);
        System.out.println(model);
        return "/admin/test";
    }

    @ResponseBody
    @GetMapping(value = "/search/{mtname}",produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<TestVO>> getList(@PathVariable("mtname")String mtname){

        TestVO testvo = new TestVO();
        testvo.setMaterial_name(mtname);

        System.out.println("이름"+mtname);

        return new ResponseEntity<>(testService.testName(testvo), HttpStatus.OK);
    }

    @GetMapping("/test2")
    public String test2(Model model) {
//        List<FinishedGoodsVO> goodslist =service.selectGoods();
//        model.addAttribute("goodslist",goodslist);
        return "/admin/test2";
    }
}
