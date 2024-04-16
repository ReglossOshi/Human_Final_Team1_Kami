package com.finalproject.finalteam1.mapper.finishedgoods;

import com.finalproject.finalteam1.domain.test.TestVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Test {
    public List<TestVO> materialDivision();
    public List<TestVO> materialName(@Param("mt") TestVO mt);
}
