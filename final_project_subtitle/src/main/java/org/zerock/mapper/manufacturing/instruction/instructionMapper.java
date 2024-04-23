package org.zerock.mapper.manufacturing.instruction;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.manufacturing.PagingVO;
import org.zerock.domain.manufacturing.manufacturingInstructionVO;
import org.zerock.domain.manufacturing.recipeVO;

import java.util.List;

public interface instructionMapper {
    public List<manufacturingInstructionVO> selectAllInstruction(@Param("paging") PagingVO paging, @Param("manufacturingInstructionVO") manufacturingInstructionVO vo);

    public int maxpageCount(@Param("manufacturingInstructionVO") manufacturingInstructionVO vo);

    public List<manufacturingInstructionVO> selectRecipeName();

    public int insertInstruction(String recipe_Name,
                                 int output,
                                 String instruction_Employee);

    public int updateInstruction(int output,
                                 int instruction_Id);
    public int deleteInstruction(int instruction_Id);



    public manufacturingInstructionVO selectRowClickInstruction(int instruction_Id);

    public List<manufacturingInstructionVO> selectInstructionForInsertPerform();

    public int updateInstructionRemainingProduction(int remainingProduction, int instruction_Id);

    public int updateInstructionRemainingProductionInPerform(int instruction_Id, int remainingProduction);

    public manufacturingInstructionVO selectOutputAndRemainingProduction(int instruction_Id);

    public int updateInstructionStatus(int instruction_Id);
}
