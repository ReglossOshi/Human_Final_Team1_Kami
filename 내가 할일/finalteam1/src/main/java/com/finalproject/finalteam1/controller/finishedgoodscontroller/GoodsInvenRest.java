package com.finalproject.finalteam1.controller.finishedgoodscontroller;

import com.finalproject.finalteam1.domain.finishedgoods.FinishedGoodsVO;
import com.finalproject.finalteam1.domain.finishedgoods.GoodsInvenVO;
import com.finalproject.finalteam1.domain.finishedgoods.StorageVO;
import com.finalproject.finalteam1.domain.paging.PagingVO;
import com.finalproject.finalteam1.service.finishedgoods.InvenService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/invenrest")
@AllArgsConstructor
public class GoodsInvenRest {
    private InvenService invenService;
    @GetMapping(value = "/goods",produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<FinishedGoodsVO>> readyGoodsList(){
        return new ResponseEntity<>(invenService.goodsList(), HttpStatus.OK);
    }

    @GetMapping(value = "/storage/{goodsnum}/page/{page}/pagesize/{pagesize}",produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<GoodsInvenVO>> availableStorage(@PathVariable("goodsnum") int goodsnum,
                                                               @PathVariable("page") int page,
                                                               @PathVariable("pagesize") int pagesize){
        GoodsInvenVO goodsInvenVO = new GoodsInvenVO();
        goodsInvenVO.setFinishedgoodsinventory_goods_id(goodsnum);
        PagingVO pagingVO = new PagingVO();
        pagingVO.setPageNum(page);
        pagingVO.setPageSize(pagesize);

        return new ResponseEntity<>(invenService.availableStorage(pagingVO,goodsInvenVO), HttpStatus.OK);
    }
}
