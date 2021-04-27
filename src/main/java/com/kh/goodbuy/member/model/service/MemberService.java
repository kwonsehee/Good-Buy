package com.kh.goodbuy.member.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.goodbuy.common.model.vo.Keyword;
import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.common.model.vo.Report;
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

		// 프사 등록
		public int updateUserPhoto(Member loginUser);
		
		// 프사 삭제
		public int deleteUserPhoto(Member loginUser);

		//포인트 업데이트
		public int updatePoint(String user_id, int user_point, int gno);
		
		//안전거래 디비 insert
		public int insertDeal(String user_id, int amount, int gno);
		
		//셀러 사진얻어오기
		public String selectSellerPhoto(String user_id);
		
		// 회원탈퇴
		public int deleteMember(String user_id);
		
		// 키워드 등록
		public int insertKeyword(Keyword k);
		
		// 키워드 조회
		public List<Keyword> selectKeyword(String user_id);
		
		// 중고상품 내 댓글 조회 
		public List<Reply> selectReplyList(String user_id, PageInfo pi);
		
		// 중고상품 내 댓글 갯수 카운트
		public int selectReplyCount(String user_id);
		
		// 마이페이지 중고상품 댓글 삭제 
		public int deleteReply(Reply r);

		public int updatememberReport(Member m);
		
		//판매자 팔로우
		public int insertFollow(String user_id, String seller);

		//판매자를 팔로우하는지 확인
		public int isFollow(String seller, String user_id);
		//팔로우취소
		public int canselFollow(String user_id, String seller);
		//판매자를 팔로우하는 멤버리스트
		public List<Member> selectFollowList(String seller, String user_id);
		//판매자가 팔로우하는 멤버리스트
		public List<Member> selectFollowingList(String seller, String user_id);
		// 로그인유저의 팔로잉 리스트 
		public List<Member> selectMyFollowingList(String user_id);
		// 로그인유저의 팔로잉 카운트 
		public int selectMyFollowingCount(String user_id);
		// 로그인유저의 팔로워 리스트 
		public List<Member> selectMyFollowerList(String user_id);
		// 로그인유저의 팔로워 카운트 
		public int selectMyFollowerCount(String user_id);
		

}
