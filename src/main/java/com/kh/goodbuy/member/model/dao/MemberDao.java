package com.kh.goodbuy.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.MyTown;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.member.model.vo.Search;



public interface MemberDao {
	// 1. 회원 로그인을 위한 메소드
	public Member selectMember(Member m);

	// 2_1. 회원가입 서비스를 위한 메소드
	public int insertMember(Member m);

	// 2_2. 회원가입 서비스를 위한 메소드 - 마이타운 insert
	public int insertMember(MyTown mt);

	public int insertMember(ArrayList<Object> list);

	public List<Member> selectList(PageInfo pi);

	public int selectListCount();

	public List<Member> searchList(Search search);

	public Member selectMemberDetail(String user_id);

	public int userIdCheck(String user_id);

	public int updateMember(Member loginUser);

	public int updateUserPhoto(Member loginUser);

	public int deleteUserPhoto(Member loginUser);

	public int updateadminMember(Member m);
	//포인트 업데이트
	public int updatePoint(String user_id, int user_point);
	//안전거래 디비 point 거래 insert
	public int insertDealPoint(String user_id, int amount, int gno);
	//안전거래 디비 insert
	public int insertDeal(String user_id, int amount, int gno);
	//셀러 사진얻어오기
	public String selectSellerPhoto(String user_id);
	


}
