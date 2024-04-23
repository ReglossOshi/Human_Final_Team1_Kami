package com.project.kammi.service;

import com.project.kammi.domain.MemberVO;

public interface MemberService {

    int putMember(MemberVO memberVO);

    int checkDuplicateUsername(String username);

    void updateUser(MemberVO memberVO);

}
