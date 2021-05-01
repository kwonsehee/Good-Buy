package com.kh.goodbuy.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.kh.goodbuy.business.model.vo.Review;
import com.kh.goodbuy.common.model.vo.Keyword;
import com.kh.goodbuy.common.model.vo.Messenger;
import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.common.model.vo.Report;
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
	// 마이페이지 중고상품 내댓글 삭제 
	public int deleteReply(Reply r);




	


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
	// 키워드 삭제 
	public int deleteKey(Keyword k);

	//안읽은 쪽지list
	public List<Messenger> selectMsgList(String user_id);

	// 아이디 찾기 
	public String findUserId(String email);
	// 임시 비밀번호 업데이트 
	public int updateRandomPwd(Member m);
	//msg봤다고 확인하기
	public int checkMsg(int mno);
	// 내가 쓴 유저 리뷰 카운트 
	public int selectUserReviewCount(String user_id);
	// 내가 쓴 유저 리뷰 리스트 
	public List<Review> selectUserReviewList(String user_id, PageInfo pi);
	// 내가 쓴 가게 리뷰 카운트 
	public int selectShopReviewCount(String user_id);
	// 내가 쓴 가게 리뷰 리스트 
	public List<Review> selectShopReviewList(String user_id, PageInfo pi);
	// 유저 리뷰 삭제 
	public int deleteUserReview(Review r);
	// 가게 리뷰 삭제 
	public int deleteShopReview(Review r);

			


}
