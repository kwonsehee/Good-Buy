package com.kh.goodbuy.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.kh.goodbuy.admin.model.vo.PageInfo;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.MyTown;

public interface MemberDao {
	// 1. 회원 로그인을 위한 메소드
	public Member selectMember(Member m);

	// 2_1. 회원가입 서비스를 위한 메소드
	public int insertMember(Member m);

	// 2_2. 회원가입 서비스를 위한 메소드 - 마이타운 insert
	public int insertMember(MyTown mt);

	public int insertMember(ArrayList<Object> list);

	public List<Member> selectList();


}
