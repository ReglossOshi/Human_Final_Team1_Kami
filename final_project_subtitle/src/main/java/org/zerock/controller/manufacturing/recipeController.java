package org.zerock.controller.manufacturing;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.manufacturing.fileVO;
import org.zerock.domain.manufacturing.recipeVO;
import org.zerock.service.manufacturing.manufacturingRecipeService;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j
@RequestMapping("/recipe")
@AllArgsConstructor
public class recipeController {
    private manufacturingRecipeService manufacturingRecipeService;
    @GetMapping
    public String index(Model model) {
        List<recipeVO> recipeVOList = manufacturingRecipeService.getRecipeList();
        model.addAttribute("recipeVOList", recipeVOList);
        log.info("레시피리스트" + recipeVOList);
        return "recipe/recipe";
    }

    @PostMapping("/upload")
    public String recipeUpload(@RequestParam("recipeName") String recipeName,
                               @RequestParam(value = "file" ,required = false) MultipartFile file ,
                               HttpServletRequest request,
                               RedirectAttributes rttr) {
        try {
            // 업로드된 파일이 존재하는 경우에만 파일 업로드 및 DB에 파일 정보 저장
            if (!file.isEmpty() && file != null) {
                // 파일 업로드 및 저장 경로 설정 코드
                String savePath = "D:\\github-wououoo\\Final_project\\final_project_subtitle\\src\\main\\resources\\static\\upload\\chickenPhoto";

                List<String> fileNameArray = new ArrayList<>();

                fileNameArray.add(file.getOriginalFilename());
                File saveFile = new File(savePath, file.getOriginalFilename());
                file.transferTo(saveFile);

                // DB에 저장할 파일 정보 생성
                fileVO fileVO = new fileVO();
                fileVO.setFileName(file.getOriginalFilename());
                fileVO.setFilePath(savePath);

                // 레시피 객체 생성 및 정보 설정
                recipeVO recipe = new recipeVO();
                recipe.setRecipe_Name(recipeName);

                log.info("파일정보........." + fileVO);
                log.info("레시피정보.........."+recipe);
                // DB에 레시피 및 파일 정보 저장
                boolean result = manufacturingRecipeService.insertRecipeAndFile(recipe, fileVO);
            }else{
                recipeVO recipe = new recipeVO();
                recipe.setRecipe_Name(recipeName);
                manufacturingRecipeService.insertRecipe(recipe);
            }


            return "redirect:/recipe";
        } catch (Exception e) {
            e.printStackTrace();
            return "error"; // 에러 페이지로 리다이렉트 또는 반환
        }
    }

    @GetMapping("/test")
    public String test() {

        return "recipe/test";
    }

    @GetMapping("/test1")
    public String test1() {

        return "recipe/test1";
    }


}
