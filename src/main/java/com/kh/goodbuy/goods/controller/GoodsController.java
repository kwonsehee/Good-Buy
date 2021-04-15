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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodbuy.common.Pagination;
import com.kh.goodbuy.goods.model.exception.GoodsExcpetion;
import com.kh.goodbuy.goods.model.service.GoodsService;
import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.goods.model.vo.Gcate;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.town.model.vo.Town;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Autowired
	private GoodsService gService;
	
	// 중고상품 리스트 페이지로
	@GetMapping("/list")
	public String goGoodsView(HttpServletRequest request,
			 @RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			 @RequestParam(value="cate", required=false, defaultValue="null") String cate,
			 Model model) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		Town myTown = (Town) request.getSession().getAttribute("townInfo");
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
		for(Gcate a :list) {
			
			System.out.println(a);
		}
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
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		//상품 정보셀렉
		Goods g = gService.Goodsdetail(gno);
		if(loginUser!=null) {
		//찜정보 셀렉
		int like = gService.likeGoods(gno, loginUser.getUser_id());
		System.out.println("like : "+like);
		if(like>0) {
			String likes = "like";
			model.addAttribute("likes", likes);
		}
		}
		model.addAttribute("g", g);
		return "goods/goodsdetail";
	}
	// 내 중고상품detail 페이지로
	@GetMapping("/mydetail")
	public String goGoodsmyDetailView() {
		return "goods/mygoodsdetail";
	}
	// 판매자 정보 페이지로
	@GetMapping("/sellerInfo")
	public String gosellerInfoView() {
		return "goods/sellerInfo";
	}

	// 판매자 following 페이지로
	@GetMapping("/sellerfollowing")
	public String gosellerfollowingView() {
		return "goods/sellerfollowing";
	}
	// 판매자에게 메세지 보내는 팝업 페이지로
	@GetMapping("/sendToseller")
	public String gosendmsgView() {
		return "goods/sendToseller";
	}
	// 판매자에게 메세지 보내는 팝업 페이지로
	@GetMapping("/sendmsgPopup")
	public String gosendmsgPopupView() {
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
	            System.out.println("================== file start ==================");
	            System.out.println("파일 이름: "+fileup[i].getName());
	            System.out.println("파일 실제 이름: "+fileup[i].getOriginalFilename());
	            System.out.println("파일 크기: "+fileup[i].getSize());
	            System.out.println("content type: "+fileup[i].getContentType());
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
				if(i==0) {
					a.setFile_level(1);
				}else {
					a.setFile_level(0);
				}
				list.add(a);
				System.out.println(renameFileName);
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
	 // 1. Stream을 이용한 text 응답
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
	  // 1. Stream을 이용한 text 응답
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
	   
}
