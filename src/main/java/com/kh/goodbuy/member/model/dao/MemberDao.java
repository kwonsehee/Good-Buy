package com.kh.goodbuy.member.model.dao;

import com.kh.goodbuy.member.model.vo.Member;

public interface MemberDao {
	//1. 회원 로그인을 위한 메소드
		public Member selectMember(Member m);
		//2. 회원가입 서비스를 위한 메소드
		public int insertMember(Member m);

}
