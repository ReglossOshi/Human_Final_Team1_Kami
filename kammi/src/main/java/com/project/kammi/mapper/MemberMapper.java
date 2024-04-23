package com.project.kammi.mapper;

import com.project.kammi.domain.MemberVO;

public interface MemberMapper {
    int insertMember(MemberVO memberVO);

    int checkDuplicateId(String username);

    MemberVO selectByUserName(String username);

    void updateUser(MemberVO memberVO);
}
