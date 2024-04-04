package org.zerock.mapper.manufacturing;

import org.zerock.domain.manufacturing.fileVO;

public interface fileMapper {
    int insertFile(fileVO file);
    String selectChickenPhoto(int recipe_Id);
}
