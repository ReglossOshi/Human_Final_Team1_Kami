package com.finalproject.finalteam1.service.test;

import com.finalproject.finalteam1.domain.test.TestVO;

import java.util.List;


public interface TestService {
    public List<TestVO> testDiv();

    public List<TestVO> testName(TestVO testVO);
}
