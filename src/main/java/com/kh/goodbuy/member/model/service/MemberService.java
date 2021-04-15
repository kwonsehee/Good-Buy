package com.kh.goodbuy.member.model.service;

import java.util.ArrayList;
import java.util.List;


import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.MyTown;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.member.model.vo.Search;


public interface MemberService {
	//Controller에서 서비스를 수행하기 위한 메소드의 이름을 정의하여 프로젝트에 규칙을 부여
	
		//1. 회원 로그인 서비스를 위한 메소드
		public Member loginMember(Member m);

		//2_1. 회원가입 서비스를 위한 메소드
		public int insertMember(Member m);

		//2_2. 회원가입 서비스를 위한 메소드 - 마이타운 insert
		public int insertMyTown(MyTown mt);

		// 2. 회원가입 서비스를 위한 메소드
		public int insertMember(ArrayList<Object> list);

		public List<Member> selectMemberList(PageInfo pi);

		public int selectListCount();

		public List<Member> searchList(Search search);


		public Member selectMemberDetail(String user_id);
		
		// id 중복확인 
		public int userIdCheck(String user_id);
		
		// 회원정보 수정
		public int updateMember(Member loginUser);
		
		// 관리자 
		public int updateadminmember(Member m);

		

	

}
