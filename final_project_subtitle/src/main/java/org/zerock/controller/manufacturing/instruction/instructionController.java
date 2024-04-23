package org.zerock.controller.manufacturing.instruction;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.manufacturing.manufacturingInstructionVO;
import org.zerock.domain.manufacturing.recipeVO;
import org.zerock.service.manufacturing.instruction.instructionService;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/instruction")
@AllArgsConstructor
public class instructionController {
    private instructionService service;

    @GetMapping
    public String selectRecipe(Model model){
        List<manufacturingInstructionVO> vo = service.selectRecipeName();
        List<manufacturingInstructionVO> vo1 = service.selectInstructionForInsertPerform();
        model.addAttribute("recipe",vo);
        model.addAttribute("insertPerform", vo1);
        return "/manufacturing/instruction";
    }

}
