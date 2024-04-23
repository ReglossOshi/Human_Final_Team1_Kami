package com.project.service;

import com.project.domain.MemberVO;
import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.validation.Errors;

import java.util.Map;

public interface MemberService {
    int putMember(MemberVO memberVO);

    int checkDuplicateUsername(String username);

    void updateUser(MemberVO memberVO);

}
