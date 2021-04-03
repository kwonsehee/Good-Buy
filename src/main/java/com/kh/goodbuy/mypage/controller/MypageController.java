package com.kh.goodbuy.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage")
@SessionAttributes({ "loginUser", "msg" })
public class MypageController {
	
	// 마이페이지 메인 화면으로
	@GetMapping("/main")
	public ModelAndView showMain(ModelAndView mv) {
		mv.setViewName("mypage/mypageMain");
		return mv;
	}
	
	// 프로필 사진 등록 화면
	@GetMapping("/profilePhoto")
	public ModelAndView showPhotoPopup(ModelAndView mv) {
		mv.setViewName("mypage/setPhotoPopup");
		return mv;
	}
	
	// 팔로잉 팝업창 화면 
	@GetMapping("/following")
	public ModelAndView showFollowing(ModelAndView mv) {
		mv.setViewName("mypage/followingPopup");
		return mv;
	}
	
	// 프로필 수정 화면
	@GetMapping("/updateMember")
	public ModelAndView showUpdateForm(ModelAndView mv) {
		mv.setViewName("mypage/memberUpdateForm");
		return mv;
	}
	
	// 포인트 내역 화면
	@GetMapping("/pointList")
	public ModelAndView showPointList(ModelAndView mv) {
		mv.setViewName("mypage/pointList");
		return mv;
	}
	
	// 판매 내역 화면(판매중)
	@GetMapping("/sellingList")
	public ModelAndView showSellingList(ModelAndView mv) {
		mv.setViewName("mypage/sellingList");
		return mv;
	}
	
	// 판매 내역 화면(숨김)
	@GetMapping("/hiddenList")
	public ModelAndView showhiddenList(ModelAndView mv) {
		mv.setViewName("mypage/hiddenList");
		return mv;
	}
	
	// 안전거래 내역 화면
	@GetMapping("/dealHistoryList")
	public ModelAndView showDealList(ModelAndView mv) {
		mv.setViewName("mypage/dealHistoryList");
		return mv;
	}
	
	// 관심목록 - 중고매물 화면
	@GetMapping("/likeGoodsList")
	public ModelAndView showLikeGoodsList(ModelAndView mv) {
		mv.setViewName("mypage/likeGoodsList");
		return mv;
	}
	
	// 관심목록 - 지역업체 화면
	@GetMapping("/likeShopList")
	public ModelAndView showLikeShopList(ModelAndView mv) {
		mv.setViewName("mypage/likeShopList");
		return mv;
	}
	
	// 관심목록 - 동네생활 화면
	@GetMapping("/likeBoardList")
	public ModelAndView showLikeBoardList(ModelAndView mv) {
		mv.setViewName("mypage/likeBoardList");
		return mv;
	}
	
	// 내 쪽지함 화면
	@GetMapping("/msgList")
	public ModelAndView showMsgList(ModelAndView mv) {
		mv.setViewName("mypage/msgList");
		return mv;
	}
	
	// 쪽지 답장 팝업 화면
	@GetMapping("/msgReply")
	public ModelAndView showMsgReply(ModelAndView mv) {
		mv.setViewName("mypage/msgReply");
		return mv;
	}
	
	// 내가 쓴 후기 화면
	@GetMapping("/sentReviewList")
	public ModelAndView showSendReviewList(ModelAndView mv) {
		mv.setViewName("mypage/sentReviewList");
		return mv;
	}
	
	// 내가 받은 후기 화면
	@GetMapping("/rcvReviewList")
	public ModelAndView showRcvReviewList(ModelAndView mv) {
		mv.setViewName("mypage/rcvReviewList");
		return mv;
	}
	
	// 내동네 설정 화면 
	@GetMapping("/setMyTown")
	public ModelAndView showSetMyTown(ModelAndView mv) {
		mv.setViewName("mypage/setMyTown");
		return mv;
	}
	
	// 키워드 알림 설정 화면
	@GetMapping("/setKeyword")
	public ModelAndView showSetKeyword(ModelAndView mv) {
		mv.setViewName("mypage/setKeyword");
		return mv;
	}
	
	// 키워드 안내 팝업 화면
	@GetMapping("/keywordPopup")
	public ModelAndView showKeywordPoup(ModelAndView mv) {
		mv.setViewName("mypage/keywordPopup");
		return mv;
	}
	
	// 내글/댓글 - 동네생활 글 화면
	@GetMapping("/myBoardList")
	public ModelAndView showMyBoardList(ModelAndView mv) {
		mv.setViewName("mypage/myBoardList");
		return mv;
	}
	
	// 내글/댓글 - 동네생활 댓글 화면
	@GetMapping("/myBoardReplyList")
	public ModelAndView showMyBoardReplyList(ModelAndView mv) {
		mv.setViewName("mypage/myBoardReplyList");
		return mv;
	}
	
	// 내글/댓글 - 중고거래 댓글 화면
	@GetMapping("/myGoodsReplyList")
	public ModelAndView showMyGoodsReplyList(ModelAndView mv) {
		mv.setViewName("mypage/myGoodsReplyList");
		return mv;
	}
	
	// 내가 한 신고 화면
	@GetMapping("/reportList")
	public ModelAndView showReportList(ModelAndView mv) {
		mv.setViewName("mypage/reportList");
		return mv;
	}
	
	// 내가 당한 신고 화면
	@GetMapping("/reportedList")
	public ModelAndView showReportedList(ModelAndView mv) {
		mv.setViewName("mypage/reportedList");
		return mv;
	}
	
	// 비즈프로필 생성 화면으로 넘기기(비즈프로필 없을 시)
	
	// 비즈프로필 조회 화면으로 넘기기(비즈프로필 있을 시)
	
	
	
	
	
}
