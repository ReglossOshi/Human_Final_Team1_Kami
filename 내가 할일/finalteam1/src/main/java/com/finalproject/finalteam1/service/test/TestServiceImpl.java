package com.finalproject.finalteam1.service.test;

import com.finalproject.finalteam1.domain.test.TestVO;
import com.finalproject.finalteam1.mapper.finishedgoods.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImpl implements TestService{

    @Autowired
    private Test test;
    @Override
    public List<TestVO> testDiv() {
        return test.materialDivision();
    }

    @Override
    public List<TestVO> testName(TestVO testVO) {
        return test.materialName(testVO);
    }
}
