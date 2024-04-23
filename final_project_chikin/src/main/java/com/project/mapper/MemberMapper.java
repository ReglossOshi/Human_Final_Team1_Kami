package com.project.mapper;

import com.project.domain.MemberVO;

public interface MemberMapper {
    int insertMember(MemberVO memberVO);

    int checkDuplicateId(String username);

    MemberVO selectByUserName(String username);

    void updateUser(MemberVO memberVO);
}
