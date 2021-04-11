package com.kh.goodbuy.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.MyTown;
import com.kh.goodbuy.town.model.service.TownService;
import com.kh.goodbuy.town.model.vo.Town;

@Controller
@RequestMapping("/mypage")
@SessionAttributes({ "loginUser","townInfo"})
public class MypageController {
	
	@Autowired
	private TownService tService;
//	@Autowired
//	private MemberService mService;
	
	
	// 마이페이지 메인 화면으로
	@GetMapping("/main")
	public ModelAndView showMain(ModelAndView mv, 
								@ModelAttribute("loginUser") Member loginUser,
								HttpServletRequest request) {
		// 마이타운 첫번째, 두번째 동네 리스트로 조회
		List<String> mtlist = tService.selectMyTownList(loginUser.getUser_id());
		
		
		Town townInfo = (Town) request.getSession().getAttribute("townInfo");
		
		if(mtlist != null) {
			mv.addObject("mtlist",mtlist);
			mv.setViewName("mypage/mypageMain");
		}
		
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
	public ModelAndView showSetMyTown(ModelAndView mv,
									  Model model,
									  @ModelAttribute("loginUser") Member loginUser
									 ) {
		// 내동네 추가 모달 창에 띄울 전체 주소 리스트
		List<Town> tlist1 = tService.selectAllTown1();
		List<Town> tlist2 = tService.selectAllTown2();
		List<Town> tlist3 = tService.selectAllTown3();
		
		if (tlist1 != null && tlist2 != null && tlist3 != null) {
			mv.addObject("tlist1", tlist1);
			mv.addObject("tlist2", tlist2);
			mv.addObject("tlist3", tlist3);
			mv.setViewName("mypage/setMyTown");
		} else {
			mv.setViewName("mypage/setMyTown");
		}
		
		// 마이타운 첫번째, 두번째 동네 리스트로 조회
		List<String> mtlist = tService.selectMyTownList(loginUser.getUser_id());
		
		//System.out.println("마이타운 리스트 : " + mtlist);
		
		if(mtlist != null) {
			mv.addObject("mtlist",mtlist);
			mv.setViewName("mypage/setMyTown");
		}
		
		return mv;
	}
	
	// 내동네 추가 메소드
	@PostMapping("/addTown")
	public String addTown(ModelAndView mv,
								Model model,
						  @RequestParam String address_3,
						  @ModelAttribute("loginUser") Member loginUser) {
		
		// 1) 넘어온 주소값에 해당하는 t_no 조회하기
		int t_no = tService.selectTownNo(address_3);
		
		// 2) MYTOWN insert
		MyTown mt = new MyTown(loginUser.getUser_id(), t_no);
		
		int insertMyNewtown = tService.insertMyNewTown(mt);
		
		
		if(insertMyNewtown > 0) {
			return "redirect:/mypage/setMyTown";
		}else {
			return "redirect:/mypage/setMyTown";
		}
		
	}
	
	// 내 동네 삭제
	@GetMapping("/deleteTown")
	public String deleteTown(@RequestParam String townName,
							 @ModelAttribute("loginUser") Member loginUser) {
		
		// 1) 넘어온 주소값에 해당하는 t_no 조회하기
		int t_no = tService.selectTownNo(townName);
		
		// 2) MYTOWN delete 
		MyTown mt = new MyTown(loginUser.getUser_id(), t_no);
		
		// 내 동네 삭제
		int result = tService.deleteTown(mt);
		
		// 내동네 한개 삭제 시 남은 내동네가 기본 동네로 업데이트 
		// 1 동네 삭제 시 -> 1로 변경
		// 2 동네 삭제 시 -> 1로 변경
		
		int result2 = tService.changeTownType(loginUser.getUser_id());
		
		if(result > 0) {
			return "redirect:/mypage/setMyTown?user_id="+loginUser.getUser_id();
		} else {
			return "common/errorpage";
		}
	}
	
	// 내동네 바꾸기 
	@GetMapping("changeTownType")
	public @ResponseBody String changeTownType(@ModelAttribute("loginUser") Member loginUser,
												Model model) {
		
		System.out.println("로그인유저 넘어왔나 " + loginUser.getUser_id());
		// 내동네 기본동네 타입 변경용
		// 1 -> 2
		// 1 -> 2
		int result = tService.changeTownType2(loginUser.getUser_id());
		
		System.out.println("동네타입 2->1로 잘 바꼈나? " + result);
		
		// 바뀐 동네정보 세션에 다시 담아주기
		Town townInfo = tService.selectUserTown(loginUser.getUser_id());
		
		if(townInfo != null) {
			model.addAttribute("townInfo", townInfo);
			System.out.println("세션에 저장되는 타운 바뀌나 : " + townInfo);
		}
		
		// ajax통신 성공 시 동적으로 화면 문구 바뀌어야 하므로
		String area = Integer.toString(townInfo.getArea());
		return area;
		
	}
	
	// 내동네 범위 바꾸기 
	@GetMapping("changeArea")
	public @ResponseBody String changeArea(@ModelAttribute("loginUser") Member loginUser,
											Model model,
											@RequestParam int t_no,
											@RequestParam int area) {
		
		System.out.println("내동네 범위 바꾸기 잘 넘어왔나 " + loginUser.getUser_id() + t_no + area);
		
		MyTown mt = new MyTown(loginUser.getUser_id(),t_no,area);
		
		int result = tService.changeArea(mt);
		
		// 바뀐 동네 정보 세션에 다시 담아주기
		Town townInfo = tService.selectUserTown(loginUser.getUser_id());
		
		if(townInfo != null) {
			model.addAttribute("townInfo", townInfo);
			System.out.println("세션에 저장되는 타운 범위 바뀌나 : " + townInfo);
		}
		
		
		if(result > 0) {
			return "Success to change area of town~!";
		} else {
			return "Fail to change area of town..";
		}
	
		
		
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
