package com.kh.goodbuy.goods.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.goodbuy.business.model.vo.Review;
import com.kh.goodbuy.common.Pagination;
import com.kh.goodbuy.common.model.vo.Keyword;
import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.goods.model.exception.GoodsExcpetion;
import com.kh.goodbuy.goods.model.service.GoodsService;
import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.goods.model.vo.Gcate;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.service.MemberService;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.town.model.vo.Town;

@Controller
@RequestMapping("/goods")

@SessionAttributes({ "g", "msg" })
public class GoodsController {
	@Autowired
	private GoodsService gService;
	@Autowired
	private MemberService mService;
	// 중고상품 리스트 페이지로
	@GetMapping("/list")
	public String goGoodsView(HttpServletRequest request,
			 @RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			 @RequestParam(value="cate", required=false, defaultValue="null") String cate,
			 Model model) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		Town myTown = (Town) request.getSession().getAttribute("townInfo");
		System.out.println("list 뽑을때 myTown : "+myTown);
		
		int listCount=0;
		int boardLimit = 10;	// 한 페이지 보여질 게시글 개수
		List<Goods> glist;
		PageInfo pi;
		System.out.println("cate : "+cate);
		if(loginUser==null) {
			if(!cate.equals("null")) {
				listCount = gService.selectCateCount(cate);
				System.out.println("로그인 유저 없을때 cate : listCount"+ listCount);
				pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
				glist = gService.selectCateList(pi, cate);
				System.out.println("로그인 유저 없을때 cate: glist"+ glist);
			}else {
				listCount = gService.selectAllCount();
				System.out.println("로그인 유저 없을때 : listCount"+ listCount);
				pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
				glist = gService.selectAllList(pi);
				System.out.println("로그인 유저 없을때 : glist"+ glist);
			}
		}else {
			if(!cate.equals("null")) {
				System.out.println("loginUser : "+ loginUser.getUser_id());
				System.out.println("myTown : "+ myTown);
				listCount = gService.selectCateCount2(myTown, cate);
				System.out.println("로그인 유저 있을때 cate: listCount"+ listCount);
				pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
				glist = gService.selectCateList2(myTown, pi, cate);
				System.out.println("로그인 유저 있을때 cate : glist"+ glist);
			}else {
			System.out.println("loginUser : "+ loginUser.getUser_id());
			System.out.println("myTown : "+ myTown);
			listCount = gService.selectListCount(myTown);
			System.out.println("로그인 유저 있을때 : listCount"+ listCount);
			pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			glist = gService.selectList(myTown, pi);
			System.out.println("로그인 유저 있을때 : glist"+ glist);
			}
		}
		model.addAttribute("glist", glist);
		model.addAttribute("pi", pi);
		return "goods/goodslist";
	}

	// 내가 등록한 중고상품 리스트 페이지로
	@GetMapping("/mylist")
	public String goMyGoodsView(HttpServletRequest request,
			 @RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			 @RequestParam(value="cate", required=false, defaultValue="null") String cate,
			 Model model) {
		
		System.out.println("로그인 유저의 상품 cate : "+ cate);
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		//Town myTown = (Town) request.getSession().getAttribute("townInfo");
		int listCount = 0;
		int boardLimit = 10;	// 한 페이지 보여질 게시글 개수
		PageInfo pi;
		List<Goods> glist;
		if(!cate.equals("null")) {
			listCount = gService.selectMyCateListCount(loginUser.getUser_id(), cate);
			System.out.println("로그인 유저꺼 cate : listCount"+ listCount);
			pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			glist = gService.selectMyCateList(loginUser.getUser_id(), pi, cate);
			System.out.println("로그인 유저꺼 cate: glist"+ glist);
			
		}
		else{
			listCount = gService.selectMyListCount(loginUser.getUser_id());
			System.out.println("로그인 유저꺼 : listCount"+ listCount);
			pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			glist = gService.selectMyList(loginUser.getUser_id(), pi);
			System.out.println("로그인 유저꺼 : glist"+ glist);
		}
		
		model.addAttribute("glist", glist);
		model.addAttribute("pi", pi);
		
		return "goods/myglist";
	}

	// 중고상품등록 페이지로
	@GetMapping("/insertView")
	public ModelAndView goGoodsInsertView(HttpServletRequest request,ModelAndView mv) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		List<Gcate> list = gService.selectCate();
//		for(Gcate a :list) {
//			
//			System.out.println(a);
//		}
		Town secondTown = gService.selectSecondTown(loginUser.getUser_id());
		mv.addObject("list", list);
		mv.addObject("secondTown", secondTown);
		mv.setViewName("goods/goodsinsert");
		return mv;
	}
	
	// 중고상품detail 페이지로
	@GetMapping("/detail")
	public String goGoodsDetailView(HttpServletRequest request,
			 @RequestParam(value="gno", required=false) int gno,
			 Model model) {
		System.out.println("받아오니? gno"+gno);
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		//상품 정보셀렉
		Goods g = gService.Goodsdetail(gno);
		System.out.println("likegggg : "+g);
		if(loginUser!=null) {
		//찜정보 셀렉
		int like = gService.likeGoods(gno, loginUser.getUser_id());
		System.out.println("like : "+like);
		if(like>0) {
			String likes = "like";
			model.addAttribute("likes", likes);
		}
		}
		List<Reply>rlist = gService.selectReplyList(g);
		model.addAttribute("g", g);
		System.out.println(rlist);
		model.addAttribute("rlist", rlist);
		return "goods/goodsdetail";
	}
	// 내 중고상품detail 페이지로
	@GetMapping("/mydetail")
	public String goGoodsmyDetailView(@RequestParam(value="gno", required=false) int gno,
			 Model model) {
		//상품 정보셀렉
		Goods g = gService.Goodsdetail(gno);
		//댓글 정보 셀렉 
		List<Reply>rlist = gService.selectReplyList(g);
		//좋아요 갯수 셀렉
		List<String>likelist = gService.selectLikeGoods(gno);
		model.addAttribute("g", g);
		System.out.println(g);
		model.addAttribute("rlist", rlist);
		model.addAttribute("likelist", likelist);
		System.out.println(likelist);
		return "goods/mygoodsdetail";
	}
	// 판매자 정보 페이지로
	@GetMapping("/sellerInfo")
	public String gosellerInfoView(String seller, Model model, HttpServletRequest request) {
		System.out.println("sellerInfo ; "+seller);
		Member sellerInfo = mService.selectMemberDetail(seller);
		System.out.println(sellerInfo);
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		//로그인 유저가 해당 셀러를 follow하는지 확인
		int follow = mService.isFollow(seller, loginUser.getUser_id());
		//판매자의 팔로워 리스트 뽑기
		List<Member> flist = mService.selectFollowList(seller, loginUser.getUser_id());
		//판매자가 팔로우하는 리스트 뽑기
		List<Member> fdlist = mService.selectFollowingList(seller, loginUser.getUser_id());
		//판매자가 판매하는 상품리스트
		List<Goods> sellingList = gService.selectSellingList(seller);
		//판매자에게 달린 리뷰리스트
		List<Review> reList = gService.selectReviewList(seller);
		//판매자에게 리뷰달수있는지 여부
		int ReviewOk = gService.reviewOk(seller, loginUser.getUser_id());
		System.out.println("followlist : "+flist);
		model.addAttribute("follow", follow);
		model.addAttribute("seller", sellerInfo);
		model.addAttribute("flist", flist);
		model.addAttribute("fdlist", fdlist);
		model.addAttribute("sellingList", sellingList);
		model.addAttribute("reList", reList);
		model.addAttribute("ReviewOk", ReviewOk);
		
		System.out.println("ReviewOk : "+ ReviewOk);
		if(seller.equals(loginUser.getUser_id())) {
			return "goods/sellerMypage";
		}else {
			return "goods/sellerInfo";	
		}
		
	}

	// 판매자 following 페이지로
	@GetMapping("/sellerfollowing")
	public String gosellerfollowingView(String seller, Model model, HttpServletRequest request) {
		Member sellerInfo = mService.selectMemberDetail(seller);
		System.out.println(sellerInfo);
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		//로그인 유저가 해당 셀러를 follow하는지 확인
		int follow = mService.isFollow(seller, loginUser.getUser_id());
		
		model.addAttribute("follow", follow);
		model.addAttribute("seller", sellerInfo);
		return "goods/sellerfollowing";
	}
	// 판매자에게 메세지 보내는 팝업 페이지로
	@GetMapping("/sendToseller")
	public String gosendmsgView(String seller,String seller_id, Model model) {
		System.out.println(seller);
		model.addAttribute("seller", seller);
		model.addAttribute("seller_id", seller_id);
		
		return "goods/sendToseller";
	}
	// 판매자에게 상품 메세지 보내는 팝업 페이지로
	@GetMapping("/sendmsgPopup")
	public String gosendmsgPopupView(HttpServletRequest request, Model model) {
		Goods g = (Goods) request.getSession().getAttribute("g");
	
		String sellerPhoto = mService.selectSellerPhoto(g.getUser_id());
		if(sellerPhoto !=null) {
			model.addAttribute("sellerPhoto", sellerPhoto);
			
		}
		
		return "goods/sendmsgPopup";
	}
	// 중고상품등록
	@PostMapping("/insert")
	public String GoodsInsert(@ModelAttribute Goods g,MultipartFile[] fileup,
			@ModelAttribute Gcate c,
			HttpServletRequest request) {
		List<Addfile> list = new ArrayList<Addfile>();

		// 업로드 파일 서버에 저장
		// 파일이 첨부되었다면
		 for(int i=0; i<fileup.length; i++) {
//	            System.out.println("================== file start ==================");
//	            System.out.println("파일 이름: "+fileup[i].getName());
//	            System.out.println("파일 실제 이름: "+fileup[i].getOriginalFilename());
//	            System.out.println("파일 크기: "+fileup[i].getSize());
//	            System.out.println("content type: "+fileup[i].getContentType());
//	            System.out.println("================== file   END ==================");
	   
		if (!fileup[i].getOriginalFilename().equals("")) {
			// System.out.println("여기오니?");
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			String renameFileName = saveFile(fileup[i], request);
			// DB에 저장하기 위한 파일명 세팅
			if (renameFileName != null) {
				Addfile a = new Addfile();
				a.setOriginName(fileup[i].getOriginalFilename());
				a.setChangeName(renameFileName);
				if(i==0) {
					a.setFile_level(1);
				}else {
					a.setFile_level(0);
				}
				list.add(a);
				// System.out.println(renameFileName);
			}
		}
		 }
	//	int ok = gService.insertFile(list);
		
		int cno = gService.selectCateNo(c);
		g.setCno(cno);
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		g.setUser_id(loginUser.getUser_id());
		System.out.println(g);
		
		int result = gService.insertGoods(g, list);
		
		// 키워드 부분 미완성
		
		// 인서트 된 상품 제목 키워드 대조 후 알람 DB 인서트 
		int result2 = gService.insertKeywordAlarm(g);
		
		System.out.println("키워드 알림 들어감? : " + result2);
		
		if(result>0) {
			
			return "redirect:/goods/list";
		}else {
			throw new GoodsExcpetion("게시글 등록에 실패하였습니다.");
		}

	}
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root= request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"/images/goodupload";
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
	 // 1. Stream을 이용한 text 응답 상품 찜하기 취소
	  @RequestMapping(value="likegoods", method=RequestMethod.POST)
	  public void likegoods( int gno, HttpServletResponse response, HttpServletRequest request) {
	      try {
	         PrintWriter out = response.getWriter();
	     	Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	         int ok = gService.deleteLike(gno, loginUser.getUser_id());
	         if(ok>0) {
	            out.write("success");
	         } else {
	            out.write("fail");
	         }
	         
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	  // 1. Stream을 이용한 text 응답 상품 찜하기
	  @RequestMapping(value="dislikegoods", method=RequestMethod.POST)
	  public void dislikegoods( int gno, HttpServletResponse response, HttpServletRequest request) {
	      try {
	         PrintWriter out = response.getWriter();
	     	Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	         int ok = gService.insertLike(gno, loginUser.getUser_id());
	         if(ok>0) {
	            out.write("success");
	         } else {
	            out.write("fail");
	         }
	         
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	   }
	  
	// 내 중고상품결제 페이지로
	@GetMapping("/pay")
	public String goGoodPay(String way,  HttpServletRequest request, Model model) {
		Goods g = (Goods) request.getSession().getAttribute("g");
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		model.addAttribute("way", way);
		model.addAttribute("g", g);
		model.addAttribute("point", loginUser.getPoint());
		System.out.println("way"+way);
		return "goods/goodsPay";
	}

	
	//댓글 작성
	@PostMapping(value="insertReply", produces ="application/json; charset= utf-8")
	public @ResponseBody String insertReply(Reply r, HttpSession session,HttpServletRequest request) {
		Goods g = (Goods) request.getSession().getAttribute("g");
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
	
		r.setRno(g.getGno());
		r.setUser_id(loginUser.getUser_id());
		
		//Service, Dao, board-mapper.xml 코드 추가
		//Service - > 댓글insert 후 댓글 select
		List<Reply>rlist = gService.insertReply(r, g);
		//날짜 포맷하기 위해 GsonBuilder 를 이용해서 Gson객체 생성
		Gson gson = new GsonBuilder()
						.setDateFormat("yyyy-MM-dd")
						.create();
				
		//응답 작성
		return gson.toJson(rlist);
	
	}

	// 댓글 삭제
	@PostMapping(value = "/deleteReply", produces = "application/json; charset= utf-8")
	public @ResponseBody String deleteReply(int rno, HttpSession session, HttpServletRequest request) {
		Goods g = (Goods) request.getSession().getAttribute("g");
//		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
//
//		r.setRno(g.getGno());
//		r.setUser_id(loginUser.getUser_id());
		
		
		// Service, Dao, board-mapper.xml 코드 추가
		// Service - > 쪽지 상태 N으로 변경 후 댓글 select
		List<Reply> rlist = gService.updateReply(rno, g);
		// 날짜 포맷하기 위해 GsonBuilder 를 이용해서 Gson객체 생성
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		// 응답 작성
		return gson.toJson(rlist);

	}
	
	// 상품 수정페이지로
	@GetMapping("/editView")
	public ModelAndView goeditView(HttpServletRequest request,ModelAndView mv,
			@RequestParam(value="gno", required=false, defaultValue="0") int gno) {
		List<Gcate> list = gService.selectCate();
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		Town secondTown = gService.selectSecondTown(loginUser.getUser_id());
		if(gno!=0) {
			//상품 정보셀렉
			Goods g = gService.Goodsdetail(gno);
			mv.addObject("g", g);
		}
		mv.addObject("list", list);
		mv.addObject("secondTown", secondTown);
		mv.setViewName("goods/goodsedit");
		return mv;
	}
	// 상품삭제 
	@GetMapping("/delete")
	public String goodsDelete(int gno, @RequestParam(value="pageName", required=false, defaultValue="null") String pageName) {
		//System.out.println(gno);
		int result = gService.deleteGoods(gno);
		
		System.out.println("페이지이름 넘어왔니 "+pageName);
		if(pageName.equals("mypage")) {
			return "redirect:/mypage/sellingList";
		}else {
			return "redirect:/goods/mylist";
		}
	}
	//상품숨김
	@GetMapping("/hide")
	public String goodsHide(int gno, Model model) {
//		System.out.println(gno);
		int result = gService.hideGoods(gno);
		if(result>0) {
			model.addAttribute("msg","hideSuccess");
			
			
		}else {
			model.addAttribute("msg","hideFail");
			
		}
		return "redirect:/goods/mylist";
	}
	  
	// 내 중고상품결제 페이지로
	@GetMapping("/uppay")
	public String goGoodUpPay( HttpServletRequest request, Model model) {
		Goods g = (Goods) request.getSession().getAttribute("g");
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		int result = gService.payUpPoint(g.getGno(), loginUser.getUser_id());
		if(result>0) {
			model.addAttribute("msg", "끌올성공");
		}else {
			
			model.addAttribute("msg", "끌올실패");
		}
		return "goods/mygoodsdetail";
	}

	// 중고상품등록
	@PostMapping("/edit")
	public String GoodsEdit(@ModelAttribute Goods g, MultipartFile[] fileup, @ModelAttribute Gcate c,
			HttpServletRequest request, Model model) {
		
		List<Addfile> list = new ArrayList<Addfile>();
		
		// 업로드 파일 서버에 저장
		// 파일이 첨부되었다면
		for (int i = 0; i < fileup.length; i++) {
			System.out.println("================== file start ==================");
			System.out.println("파일 이름: " + fileup[i].getName());
			System.out.println("파일 실제 이름: " + fileup[i].getOriginalFilename());
			System.out.println("파일 크기: " + fileup[i].getSize());
			System.out.println("content type: " + fileup[i].getContentType());
			System.out.println("================== file   END ==================");

			if (!fileup[i].getOriginalFilename().equals("")) {
				System.out.println("여기오니?");
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
				String renameFileName = saveFile(fileup[i], request);
				// DB에 저장하기 위한 파일명 세팅
				if (renameFileName != null) {
					Addfile a = new Addfile();
					a.setOriginName(fileup[i].getOriginalFilename());
					a.setChangeName(renameFileName);

					a.setFile_level(0);
				
					list.add(a);
					System.out.println(renameFileName);
				}
			}
		}
		System.out.println("여기오니 ");
		System.out.println(c);
		int cno = gService.selectCateNo(c);
		g.setCno(cno);
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		g.setUser_id(loginUser.getUser_id());
		System.out.println(g);

		int result = gService.updateGoods(g , list);
		if (result > 0) {
			model.addAttribute("gno", g.getGno());
			return "redirect:/goods/mydetail";
		} else {
			throw new GoodsExcpetion("게시글 수정에 실패하였습니다.");
		}

	}

	// 파일삭제
	@RequestMapping(value = "deleteFile", method = RequestMethod.POST)
	public void test1(String index, HttpServletResponse response) {
		System.out.println("여기오니?" + index);
		int result = gService.deleteFile(index);
		try {
			PrintWriter out = response.getWriter();
			if (result > 0) {

				out.write("success");
			} else {
				out.write("fail");
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 중고상품검색
	@GetMapping("/search")
	public String GoodsSearch(String search, @RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			HttpServletRequest request, Model model) {
		Town myTown = (Town) request.getSession().getAttribute("townInfo");
		System.out.println("search myTown"+myTown);
		int listCount=0;
		int boardLimit = 10;	// 한 페이지 보여질 게시글 개수
		List<Goods> glist;
		PageInfo pi;
		if(myTown !=null) {
			listCount = gService.selectMySearchCount(search, myTown);
			System.out.println("search : "+listCount);
			System.out.println("로그인 유저 있을때 search : listCount"+ listCount);
			pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			glist = gService.selectMySearchList(pi, search, myTown);
//			glist = gService.selectSearchList(pi, search);
			System.out.println("로그인 유저 있을때 search: glist"+ glist);
			
		}else {
			listCount = gService.selectSearchCount(search);
			System.out.println("search : "+listCount);
			System.out.println("로그인 유저 없을때 search : listCount"+ listCount);
			pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
			glist = gService.selectSearchList(pi, search);
			System.out.println("로그인 유저 없을때 search: glist"+ glist);
			
		}
		model.addAttribute("glist", glist);
		model.addAttribute("pi", pi);
		model.addAttribute("search", search);
		
		return "goods/goodslist";
	}

	// review 작성
	@PostMapping(value = "/reviewInsert", produces = "application/json; charset= utf-8")
	public @ResponseBody String insertReview(Review r, HttpSession session, HttpServletRequest request) {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");

		
		r.setWriterId(loginUser.getUser_id());
		
		System.out.println("여기오니 ? review"+r);
		// Service - > 댓글insert 후 댓글 select
		List<Review> rlist=gService.insertReview(r, r.getUserId());
		// 날짜 포맷하기 위해 GsonBuilder 를 이용해서 Gson객체 생성
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		System.out.println("새로 뽑은 리뷰 : "+rlist);
		// 응답 작성
		return gson.toJson(rlist);

	}
	// review 삭제
	@PostMapping(value = "/reviewDelete", produces = "application/json; charset= utf-8")
	public @ResponseBody String deleteReview(int rno,String seller,  HttpSession session, HttpServletRequest request) {

		System.out.println("여기오니 ? review" + rno+"seller"+seller);
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");


		// Service - > 댓글insert 후 댓글 select
		List<Review> rlist = gService.deleteReview(rno, seller);
		// 날짜 포맷하기 위해 GsonBuilder 를 이용해서 Gson객체 생성
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		System.out.println("새로 뽑은 리뷰 : " + rlist);
		// 응답 작성
		return gson.toJson(rlist);

	}
}
