package org.zerock.controller.manufacturing;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.zerock.domain.manufacturing.recipeStandardVO;
import org.zerock.service.manufacturing.manufacturingRecipeService;

import java.util.List;

@RequestMapping("/recipe/rest")
@RestController
@Log4j
@AllArgsConstructor
public class recipeRestController {
    private manufacturingRecipeService service;


    @PostMapping(value = "/getPhoto", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<String> getPhoto(
            @PathVariable("recipe_Id") int recipe_Id
    ) {
        log.info("getPhoto.................");

        return new ResponseEntity<>(service.selectChickenPhoto(recipe_Id), HttpStatus.OK);
    }
    @PostMapping("/recipe-standard")
    public String insertRecipeStandardList(@RequestBody List<recipeStandardVO> recipeStandardList) {
        log.info("레시피스탠다드개수" + recipeStandardList);
        try {
            int count = service.insertRecipeStandardList(recipeStandardList);
            return (count + "개");
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred: " + e.getMessage();
        }
    }
}

