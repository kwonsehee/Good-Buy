package com.kh.goodbuy.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodbuy.board.model.service.BoardService;
import com.kh.goodbuy.board.model.vo.Board;
import com.kh.goodbuy.business.model.service.BusinessService;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.common.Pagination;
import com.kh.goodbuy.common.model.service.MessengerService;
import com.kh.goodbuy.common.model.service.ReportService;
import com.kh.goodbuy.common.model.vo.Keyword;
import com.kh.goodbuy.common.model.vo.Messenger;
import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.common.model.vo.Report;
import com.kh.goodbuy.goods.model.service.GoodsService;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.service.MemberService;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.MyTown;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.town.model.service.TownService;
import com.kh.goodbuy.town.model.vo.Town;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/mypage")
@SessionAttributes({ "loginUser","townInfo","mtlist"})
public class MypageController {
	
	@Autowired
	private TownService tService;
	@Autowired
	private MemberService mService;
	@Autowired
	private GoodsService gService;
	@Autowired
	private MessengerService msgService;
	@Autowired
	private ReportService reService;
	@Autowired
	private BusinessService bService;
	@Autowired
	private BoardService boService;
	
	
	// 마이페이지 메인 화면으로
	@GetMapping("/main")
	public ModelAndView showMain(ModelAndView mv, 
								@ModelAttribute("loginUser") Member loginUser,
								HttpServletRequest request,
								Model model) {
		// 마이타운 첫번째, 두번째 동네 리스트로 조회
		List<String> mtlist = tService.selectMyTownList(loginUser.getUser_id());
		System.out.println("mtlist : " + mtlist);
		
		int followingCnt = mService.selectMyFollowingCount(loginUser.getUser_id());
		int followerCnt = mService.selectMyFollowerCount(loginUser.getUser_id());
		
		
		if(mtlist != null) {
			mv.addObject("followingCnt", followingCnt);
			mv.addObject("followerCnt", followerCnt);
			mv.addObject("mtlist",mtlist);
			mv.setViewName("mypage/mypageMain");
		}
		
		return mv;
	}

	// 팔로잉 팝업창 화면 
	@GetMapping("/following")
	public ModelAndView showFollowing(ModelAndView mv,@ModelAttribute("loginUser") Member loginUser) {
		System.out.println("팔로잉 팝업 로그인유저 : " + loginUser.getUser_id());
		
		List<Member> flist = mService.selectMyFollowingList(loginUser.getUser_id());
		
		int cnt = mService.selectMyFollowingCount(loginUser.getUser_id());
		
		System.out.println("팔로잉 갯수 : " + cnt);
		System.out.println("팔로잉 list : " + flist);
		
		
		mv.addObject("flist", flist);
		mv.addObject("cnt",cnt);
		mv.setViewName("mypage/followingPopup");
		return mv;
	}
	// 팔로워 팝업창 화면 
	@GetMapping("/follower")
	public ModelAndView showFollower(ModelAndView mv,@ModelAttribute("loginUser") Member loginUser) {
		System.out.println("팔로잉 팝업 로그인유저 : " + loginUser.getUser_id());
		
		List<Member> flist = mService.selectMyFollowerList(loginUser.getUser_id());
		
		int cnt = mService.selectMyFollowerCount(loginUser.getUser_id());
		
		System.out.println("팔로워 갯수 : " + cnt);
		System.out.println("팔로워 list : " + flist);
		
		
		mv.addObject("flist", flist);
		mv.addObject("cnt",cnt);
		mv.setViewName("mypage/followerPopup");
		return mv;
	}
	
	
	
	// 프로필 수정 화면
	@GetMapping("/updateMember")
	public ModelAndView showUpdateForm(ModelAndView mv) {
		List<Town> tlist1 = tService.selectAllTown1();
		List<Town> tlist2 = tService.selectAllTown2();
		List<Town> tlist3 = tService.selectAllTown3();
		
		if (tlist1 != null && tlist2 != null && tlist3 != null) {
			mv.addObject("tlist1", tlist1);
			mv.addObject("tlist2", tlist2);
			mv.addObject("tlist3", tlist3);
			mv.setViewName("mypage/memberUpdateForm");
		} else {
			mv.setViewName("mypage/memberUpdateForm");
		}
		
		return mv;
	}
	
	// 프사 등록 - 리네임 
	@PostMapping("/photoInsert")
	public String UserPhotoInsert(@ModelAttribute("loginUser") Member loginUser,
								 Model model,
								 @RequestParam(value="uploadPhoto") MultipartFile file,
								 HttpServletRequest request) {
		
		// 업로드 파일 서버에 저장
		// 파일이 첨부되었다면
		if(!file.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			String renameFileName = saveFile(file, request);
			
			// DB에 저장하기 위한 파일명 세팅
			if(renameFileName != null) {
				loginUser.setPhoto(renameFileName);
			}
		}
		
		int result = mService.updateUserPhoto(loginUser);
		System.out.println("프사 등록 됐니? : " + result);
		
		if(result > 0) {
			// 프사 업데이트된 유저 정보 세션에 저장
			model.addAttribute("loginUser", loginUser);
			return "redirect:/mypage/main";
		} else {
			return "common/errorpage";
		}
		
	}
	
	// 프사 실제 파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root= request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"/images/userProfilePhoto";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdir();
		
		//파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date())+"_"+(int)(Math.random()*100000)+originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "/"+renameFileName;//저장하고자 하는 경로 + 파일명
		
		try {
			file.transferTo(new File(renamePath));//=>업로드 된 파일(MultipartFile) 이 rename명으로 서버에 저장
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : "+e.getMessage());
		}
		
		return renameFileName;
	}
	
	
	// 프사 삭제
	@PostMapping("/deletePhoto")
	public String deleteUserPhoto(@ModelAttribute("loginUser") Member loginUser,
								HttpServletRequest request,
								 Model model) {
		
		// 기존 프사가 있다면
		if(!loginUser.getPhoto().equals("")) {
			deleteFile(loginUser.getPhoto(),request);
		}
		
		// DB에서 photo컬럼 null로
		int result = mService.deleteUserPhoto(loginUser);
		
		System.out.println("프사 삭제 됐나? " + result);
		
		// 로그인 유저 다시 조회 후 세션에 셋팅
		Member loginUser2 = mService.loginMember(loginUser);
		
		if(result > 0) {
			model.addAttribute("loginUser", loginUser2);
			return "redirect:/mypage/main";
		} else {
			return "common/errorpage";
		}
		
	}
	
	// 프사 실제 파일 삭제
	public void deleteFile(String renameFileName,HttpServletRequest request) {
		String root= request.getSession().getServletContext().getRealPath("resources");
		File deleteFile = new File(root+"/images/userProfilePhoto/"+renameFileName);
		System.out.println("deleteFile메소드 오니? ");
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}
	
	
	// 포인트 내역 화면
	@GetMapping("/pointList")
	public ModelAndView showPointList(ModelAndView mv) {
		mv.setViewName("mypage/pointList");
		return mv;
	}
	
	// 판매 내역 화면(판매중)
	@GetMapping("/sellingList")
	public ModelAndView showSellingList(ModelAndView mv,
										@ModelAttribute("loginUser") Member loginUser, 
										@RequestParam(value="page", required=false, defaultValue="1") int currentPage){
		int listCount = 0;
		int boardLimit = 5;
		PageInfo pi;
		
		List<Goods> sellingList;
		// where절에 gstatus 상관없이 모두 셀렉
		listCount = gService.selectMyListCount(loginUser.getUser_id());
		pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		sellingList = gService.selectMySellingList(loginUser.getUser_id(), pi);
		
		mv.addObject("pi", pi);
		mv.addObject("sellingList", sellingList);
		
		mv.setViewName("mypage/sellingList");
		
		return mv;
	}
	
	// 마이페이지 판매내역
	// 판매중 -> 숨김 상태 변경
	// 숨김 -> 판매중 상태 변경
	@GetMapping("/changeGoodsStatus")
	public String changeGoodsStatus(int gno,String status,@ModelAttribute("loginUser")Member loginUser) {
		
		System.out.println("gno + status 넘어왔니~? " + gno + status);
		
		Goods g = new Goods(gno,loginUser.getUser_id());

		int result = gService.changeGoodsStatus(g,status);
		
		System.out.println("상품 상태 변경됐니?" + result);
		
		if(result > 0) {
			return "redirect:/mypage/sellingList";
		}else {
			return "common/errorpage";
		}
		
	}

	
	// 판매 내역 화면(숨김)
	@GetMapping("/hiddenList")
	public ModelAndView showhiddenList(ModelAndView mv,
										@ModelAttribute("loginUser") Member loginUser, 
										Model model,
										@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		int listCount = 0;
		int boardLimit = 5;
		PageInfo pi;
		
		List<Goods> hiddenList;
		listCount = gService.selectMyHiddenListCount(loginUser.getUser_id());
		pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		hiddenList = gService.selectMyHiddenList(loginUser.getUser_id(), pi);

		System.out.println("hiddenList : " + hiddenList);
		
		mv.addObject("pi", pi);
		mv.addObject("hiddenList", hiddenList);
		
		mv.setViewName("mypage/hiddenList");
		return mv;
	}
	
	// 안전거래 내역 화면
	@GetMapping("/dealHistoryList")
	public ModelAndView showDealList(ModelAndView mv,
									@ModelAttribute("loginUser") Member loginUser,
									@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		int listCount = 0;
		int boardLimit = 5;
		PageInfo pi;
		
		List<Goods> dealList;
		listCount = gService.selectMyDealListCount(loginUser.getUser_id());
		System.out.println("내가 결제한 상품 카운트  : " + listCount);
		pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		dealList = gService.selectMyDealList(loginUser.getUser_id(),pi);
		
		System.out.println("거래내역 리스트 : " + dealList);
		
		mv.addObject("pi", pi);
		mv.addObject("dealList", dealList);
		
		mv.setViewName("mypage/dealHistoryList");
		return mv;
	}
	
	// 관심목록 - 중고매물 화면
	@GetMapping("/likeGoodsList")
	public ModelAndView showLikeGoodsList(ModelAndView mv,
											@ModelAttribute("loginUser") Member loginUser,
											@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		int listCount = 0;
		int boardLimit = 5;
		PageInfo pi;
		
		List<Goods> likeList;
		listCount = gService.selectMyLikeGoodsCount(loginUser.getUser_id());
		System.out.println("내가 찜한 상품 카운트  : " + listCount);
		pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		likeList = gService.selectMyLikeGoodsList(loginUser.getUser_id(),pi);
		
		System.out.println("찜상품 리스트 : " +likeList);
		
		mv.addObject("pi", pi);
		mv.addObject("likeList", likeList);
		
		mv.setViewName("mypage/likeGoodsList");
		return mv;
	}
	// 관심목록 - 중고매물 찜취소
	@GetMapping("/cancelLikeOfGoods")
	public String cancelLikeOfGoods(@ModelAttribute("loginUser") Member loginUser,int gno) {
		
		System.out.println("찜취소 gno넘어오니 : " + gno);
		
		int ok = gService.deleteLike(gno, loginUser.getUser_id());
		
		if(ok > 0) {
			return "redirect:/mypage/likeGoodsList";
		} else {
			return "common/errorpage";
		}
		
	}
	
	
	// 관심목록 - 지역업체 화면
	@GetMapping("/likeShopList")
	public ModelAndView showLikeShopList(@ModelAttribute("loginUser") Member loginUser,ModelAndView mv,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int listCount = 0;
		int boardLimit = 5;
		PageInfo pi;
		
		listCount = bService.selectMyFavShopCount(loginUser.getUser_id());
		pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		List<Business> blist = bService.selectMyFavShopList(loginUser.getUser_id(),pi);
		
		System.out.println("단골 추가 가게 카운트  : " + listCount);
		System.out.println("단골 추가 가게 리스트  : " + blist);
		
		mv.addObject("pi", pi);
		mv.addObject("blist", blist);
		
		mv.setViewName("mypage/likeShopList");
		return mv;
	}
	
	
	// 관심목록 - 동네생활 화면
	@GetMapping("/likeBoardList")
	public ModelAndView showLikeBoardList(ModelAndView mv) {
		mv.setViewName("mypage/likeBoardList");
		return mv;
	}
	
	// 내 쪽지함(상품)
	@GetMapping("/msgList")
	public ModelAndView showMsgList(ModelAndView mv,
									@ModelAttribute("loginUser") Member loginUser,
									@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
				
		int listCount = 0;
		int boardLimit = 10;
		PageInfo pi;
		listCount = msgService.selectMsgCount(loginUser.getUser_id());
		
		pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		List<Messenger> mlist;
		
		System.out.println("쪽지 갯수  : " + listCount);
		mlist = msgService.selectMsgList(loginUser.getUser_id(),pi);
		System.out.println("쪽지 리스트  : "+mlist);
		System.out.println("pi " +pi);
		
		mv.addObject("pi", pi);
		mv.addObject("mlist", mlist);
				
		mv.setViewName("mypage/msgList");
		return mv;
	}
	
	// 내 쪽지함(판매자쪽지)
	@GetMapping("/userMsgList")
	public ModelAndView userMsgList(ModelAndView mv,
									@ModelAttribute("loginUser") Member loginUser,
									@RequestParam(value="page", required=false, defaultValue="1") int currentPage
									) {
		
		int listCount = 0;
		int boardLimit = 10;
		PageInfo pi;
		listCount = msgService.selectUserMsgCount(loginUser.getUser_id());
		
		pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		List<Messenger> mlist;
		
		System.out.println("쪽지 갯수  : " + listCount);
		mlist = msgService.selectUserMsgList(loginUser.getUser_id(),pi);
		System.out.println("쪽지 리스트  : "+mlist);
		System.out.println("pi " +pi);
		
		mv.addObject("pi", pi);
		mv.addObject("mlist", mlist);
				
		mv.setViewName("mypage/userMsgList");
		
		return mv;
		
	}
	
	// 쪽지 답장 팝업 화면(상품)
	@GetMapping("/msgReply")
	public ModelAndView showMsgReply(ModelAndView mv,int mno) {
		System.out.println("mno넘어왔니 : " + mno);
		
		
		Messenger m = msgService.selectOneMsg(mno);
		
		System.out.println("m 조회됐니 : " + m);
		
		mv.addObject("m", m);
		mv.setViewName("mypage/msgReply");
		
		return mv;
	}
	
	// 쪽지 답장 팝업 화면(판매자)
	@GetMapping("/msgReply2")
	public ModelAndView showMsgReply2(ModelAndView mv, int mno) {
		System.out.println("mno넘어왔니 : " + mno);
		
		
		Messenger m = msgService.selectOneMsg2(mno);
		
		System.out.println("m 조회됐니 : " + m);
		
		mv.addObject("m", m);
		mv.setViewName("mypage/msgReply2");
		
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
	@GetMapping("/changeTownType")
	public @ResponseBody void changeTownType(@ModelAttribute("loginUser") Member loginUser,
												Model model,
												HttpServletResponse response) {
	    response.setContentType("application/json; charset=utf-8");
		
		System.out.println("로그인유저 넘어왔나 " + loginUser.getUser_id());
		// 1. 내동네 기본동네 타입 변경
		// 1 -> 2
		// 2 -> 1
		int result = tService.changeTownType2(loginUser.getUser_id());
		
		System.out.println("동네타입 2->1로 잘 바꼈나? " + result);
		
		// 2. 바뀐 동네정보 세션에 다시 담아주기
		Town townInfo = tService.selectUserTown(loginUser.getUser_id());
		
		if(townInfo != null) {
			model.addAttribute("townInfo", townInfo);
			System.out.println("세션에 저장되는 타운 바뀌나 : " + townInfo);
		}
		
		// 3. ajax통신 성공 시 range부분도 새롭게 바꿔줘야 하므로 Town 리턴
		JSONObject sendTown = new JSONObject();
		sendTown.put("t_no",townInfo.getT_no());
		sendTown.put("area",townInfo.getArea());
		sendTown.put("address_1",townInfo.getAddress_1());
		sendTown.put("address_2",townInfo.getAddress_2());
		sendTown.put("address_3",townInfo.getAddress_3());
		
		
	    // 4. 전송 
	      try {
	         PrintWriter out = response.getWriter();
	         out.print(sendTown);
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
		
	}
	
	// 메뉴바에서 내동네 바꾸기
	@GetMapping("/changeTownType2")
	public String changeTownType2(@ModelAttribute("loginUser") Member loginUser,
												Model model,
												HttpServletResponse response,
												HttpServletRequest request,
												String contextPath
												) {
		response.setContentType("application/json; charset=utf-8");
		
		
		int result = tService.changeTownType2(loginUser.getUser_id());
		
		System.out.println("동네타입 2->1로 잘 바꼈나? " + result);
		
		List<String> mtlist = tService.selectMyTownList(loginUser.getUser_id());
		System.out.println("메뉴바에서 동네 바꾼 후 : " + mtlist);
		
		// 세션에 다시 저장
		model.addAttribute("mtlist", mtlist);
		// 바뀐 동네 정보 세션에 다시 담아주기
		Town townInfo2 = tService.selectUserTown(loginUser.getUser_id());
				
		if(townInfo2 != null) {
			model.addAttribute("townInfo", townInfo2);
			System.out.println("세션에 저장되는 타운 범위 바뀌나 : " + townInfo2);
		}
		
		System.out.println("contextPath넘어왔나 : " + contextPath);
		
		return"redirect:/home";
	}
	
	// 내동네 범위 바꾸기 
	@GetMapping("/changeArea")
	public @ResponseBody void changeArea(@ModelAttribute("loginUser") Member loginUser,
											@ModelAttribute("townInfo") Town townInfo,
											Model model,
											@RequestParam int area,
											HttpServletResponse response) {
		response.setContentType("application/json; charset=utf-8");
		
		System.out.println("내동네 범위 바꾸기 잘 넘어왔나 " + loginUser.getUser_id() +"범위 : " +area);
		
		MyTown mt = new MyTown(loginUser.getUser_id(),townInfo.getT_no(),area);
		
		System.out.println("범위 바꾸려는 동네 넘버 : " + townInfo.getT_no());
		
		int result = tService.changeArea(mt);
		
		// 바뀐 동네 정보 세션에 다시 담아주기
		Town townInfo2 = tService.selectUserTown(loginUser.getUser_id());
		
		if(townInfo2 != null) {
			model.addAttribute("townInfo", townInfo2);
			System.out.println("세션에 저장되는 타운 범위 바뀌나 : " + townInfo2);
		}

		// ajax통신 성공 시 텍스트변경 부분도 새롭게 바꿔줘야 하므로 Town 리턴
		// 내동네 설정용
		JSONObject sendTown = new JSONObject();
		sendTown.put("t_no",townInfo2.getT_no());
		sendTown.put("area",townInfo2.getArea());
		sendTown.put("address_1",townInfo2.getAddress_1());
		sendTown.put("address_2",townInfo2.getAddress_2());
		sendTown.put("address_3",townInfo2.getAddress_3());
		// 4. 전송 
	      try {
	         PrintWriter out = response.getWriter();
	         out.print(sendTown);
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
		
	}
	
	
	// 키워드 알림 설정 화면
	@GetMapping("/setKeyword")
	public ModelAndView showSetKeyword(ModelAndView mv,Model model,@ModelAttribute("loginUser") Member loginUser) {
		// insert 후 키워드 조회 후 화면에 뿌리기
		List<Keyword> list = mService.selectKeyword(loginUser.getUser_id());
		System.out.println("키워드 리스트 : " + list);
		mv.addObject("list", list);
		mv.setViewName("mypage/setKeyword");
		return mv;
	}
	
	// 키워드 DB insert
	@GetMapping("/insertKey")
	public String insertKey(String key,@ModelAttribute("loginUser") Member loginUser,Model model) {
		System.out.println("키워드 넘어오니  : " + key);
		
		Keyword k = new Keyword();
		k.setUser_id(loginUser.getUser_id());
		k.setKeyword(key);
		
		// 키워드 DB insert
		int result = mService.insertKeyword(k);
		
		System.out.println("키워드 디비 들어감? " + result);
		System.out.println("k : " + k);
		
		// insert 후 키워드 조회 후 화면에 뿌리기
		List<Keyword> list = mService.selectKeyword(loginUser.getUser_id());
		//System.out.println("키워드 리스트 : " + list);
		model.addAttribute("list", list);
		
		return "redirect:/mypage/setKeyword";
		
	}
	
	// 키워드 삭제
	@GetMapping("/deleteKey")
	public String deleteKey(String key,@ModelAttribute("loginUser") Member loginUser,Model model) {
		System.out.println("키워드 넘어오니  : " + key);
		
		Keyword k = new Keyword();
		k.setKeyword(key);
		k.setUser_id(loginUser.getUser_id());
		
		int result = mService.deleteKey(k);
		
		System.out.println("키워드 지워짐 ? " + result);
		
		if(result > 0) {
			return "redirect:/mypage/setKeyword";
		} else {
			return "common/errorpage";
		}
		
	}
	
	// 키워드 안내 팝업 화면
	@GetMapping("/keywordPopup")
	public ModelAndView showKeywordPoup(ModelAndView mv) {
		mv.setViewName("mypage/keywordPopup");
		return mv;
	}
	
	// 내글/댓글 - 동네생활 글 화면
	@GetMapping("/myBoardList")
	public ModelAndView showMyBoardList(ModelAndView mv,@ModelAttribute("loginUser") Member loginUser,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int listCount = 0;
		int boardLimit = 10;
		PageInfo pi;
		listCount = boService.selectMyBoardListCount(loginUser.getUser_id());
		
		pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		List<Board> blist = boService.selectMyBoardList(loginUser.getUser_id(),pi);
		
		System.out.println("내가 쓴 글 listCount : " + listCount);
		System.out.println("내가 쓴 글 list : " + blist);
		
		
		mv.addObject("pi", pi);
		mv.addObject("blist", blist);
		
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
	public ModelAndView showMyGoodsReplyList(ModelAndView mv,@ModelAttribute("loginUser") Member loginUser,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int listCount = 0;
		int boardLimit = 10;
		PageInfo pi;
		listCount = mService.selectReplyCount(loginUser.getUser_id());
		
		pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		List<Reply> list = mService.selectReplyList(loginUser.getUser_id(),pi);
		
		System.out.println("댓글 리스트 : " + list);
		
		mv.addObject("list", list);
		mv.addObject("pi",pi);
		mv.setViewName("mypage/myGoodsReplyList");

		return mv;
	}
	
	// 중고상품 댓글 삭제
	@GetMapping("deleteReply")
	public String deleteReply(int rno,@ModelAttribute("loginUser") Member loginUser) {
		
		Reply r = new Reply();
		r.setRno(rno);
		r.setUser_id(loginUser.getUser_id());
		
		int result = mService.deleteReply(r);
		
		if(result > 0) {
			return "redirect:/mypage/myGoodsReplyList";
		} else {
			return "common/errorpage";
		}
	}
	
	
	
	// 내가 한 신고 화면
	@GetMapping("/reportList")
	public ModelAndView showReportList(ModelAndView mv,@ModelAttribute("loginUser") Member loginUser,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int listCount = 0;
		int boardLimit = 5;
		PageInfo pi;
		listCount = reService.selectMyReportCount(loginUser.getUser_id());
		
		pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		List<Report> rlist = reService.selectMyReportList(loginUser.getUser_id(),pi);
		
		System.out.println("신고리스트 : " + rlist);
		System.out.println("신고 갯수 : " + listCount);
		
		
		if(rlist != null) {
			mv.addObject("rlist", rlist);
			mv.addObject("pi", pi);
			mv.setViewName("mypage/reportList");
		}
		
		return mv;
	}
	
	
	// 내가 당한 신고 화면
	@GetMapping("/reportedList")
	public ModelAndView showReportedList(ModelAndView mv,
									    @ModelAttribute("loginUser") Member loginUser,
										@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int listCount = 0;
		int boardLimit = 5;
		PageInfo pi;
		listCount = reService.selectMyReportedCount(loginUser.getUser_id());
		
		pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		List<Report> rlist = reService.selectReportedList(loginUser.getUser_id(),pi);
		

		System.out.println("신고당한리스트 : " + rlist);
		System.out.println("신고 당한횟수 : " + listCount);
		
		if(rlist != null) {
			mv.addObject("rlist", rlist);
			mv.addObject("pi", pi);
			mv.setViewName("mypage/reportedList");
		}
		
		return mv;
	}
	
	
	
}
