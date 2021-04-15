package com.kh.goodbuy.business.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodbuy.business.model.service.BusinessService;
import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;
import com.kh.goodbuy.business.model.vo.NewsAttachment;
import com.kh.goodbuy.business.model.vo.Review;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.town.model.vo.Town;

@Controller
@RequestMapping("/business")
public class BusinessController {
	@Autowired
	private BusinessService bService;
	
	// 내 근처 페이지
	@GetMapping("/list")
	public ModelAndView BusinessView(ModelAndView mv, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUser_id();
		Town townInfo = (Town)session.getAttribute("townInfo");


		List<Business> bList = bService.selectbList(townInfo);
		List<News> nList = bService.selectnList(townInfo);		
		List<Attachment> fList = bService.selectfList();
		List<NewsAttachment> nfList = bService.selectnfList();
		List<Review> rList = bService.selectrList();
		mv.addObject("color",0);
		mv.addObject("bList",bList);
		mv.addObject("nList",nList);
		mv.addObject("fList",fList);
		mv.addObject("nfList",nfList);
		mv.addObject("rList",rList);
		System.out.println(bList);
		System.out.println(nList);
		System.out.println(fList);
		System.out.println(nfList);
		System.out.println(townInfo);
		System.out.println(rList);
		mv.setViewName("business/myNear");

		return mv;
	}
	

	
	// 비즈니스 상세페이지
	@GetMapping("/detail")
	public String BusinessDetailView(int shopNo,
									HttpServletRequest request,
									HttpServletResponse response,
									Model model) {
		boolean flagbList = false;
		boolean flagshopNo = false;
		
		Cookie[] cookies = request.getCookies();
		
		 try {
	         if (cookies != null) {
	            for (Cookie c : cookies) {
	               // 읽은 게시글의 shopNo를 모아서 보관하는 bList가 쿠키 안에 있다면
	               if (c.getName().equals("bList")) {
	                  flagbList = true;
	                  // 기존 쿠키 값 먼저 읽어옴
	                  String bList = URLDecoder.decode(c.getValue(), "UTF-8");
	                  // , 구분자 기준으로 나누기
	                  String[] list = bList.split(",");
	                  for(String st:list) {
	                     // 쿠키 안에 지금 클릭한 게시글의 bid가 들어있다면 => 읽었음을 표시
	                     if(st.equals(String.valueOf(shopNo))) flagshopNo = true;
	                  }
	                  if(!flagshopNo) { // 게시글을 읽지 않았다면 
	                     c.setValue(URLEncoder.encode(bList + "," + shopNo, "UTF-8"));
	                     response.addCookie(c); // 응답에 담아 보냄 
	                  }
	               }
	            }
	            if(!flagbList) {
	               // blist라는 쿠키가 만들어지지 않은 경우
	               Cookie c1 = new Cookie("bList", URLEncoder.encode(String.valueOf(shopNo), "UTF-8"));
	               response.addCookie(c1);
	            }
	         }

	      } catch (UnsupportedEncodingException e) {
	         e.printStackTrace();
	      }
		 
		 Business b = bService.selectDetail(shopNo, !flagshopNo);
		 News n = bService.selectDetailNews(shopNo);
		 List<Review> rList = bService.selectDetailReview(shopNo);
		 model.addAttribute("business",b);
		 model.addAttribute("news",n);
		 model.addAttribute("rList",rList);
		 System.out.println("b: " +b);
		 System.out.println("n: " +n);
		 System.out.println("rList : " + rList);
		 
		return "business/businessDetail";
	}
	
	// 비즈니스 설정페이지
	@GetMapping("/setting")
	public String BusinessSetting() {
		
		return "business/businessSetting";
	}
	
	// 광고하기 페이지
	@GetMapping("/ad")
	public String adPage() {
		return "business/adPage";
	}
	
	// 소식발행 팝업페이지
	@GetMapping("/newsWriter")
	public String newsWrite() {
		return "business/newsWriter";
	}
	
	// 후기 작성 팝업페이지
	@GetMapping("/reviewWrite")
	public String reviewWrite() {
		return "business/reviewWrite";
	}
	
	// 정보 관리 팝업 페이지
	@GetMapping("infoSet")
	public String infoSet(Business bus) {
		
		int result = bService.infoInsert(bus);
		return "business/businessSetting";
	}
	
	// 가격설정 팝업 페이지
	@GetMapping("priceSet")
	public String priceSet() {
		return "business/priceSet";
	}
	
	// 광고 조회수 설정 페이지
	@GetMapping("viewCount")
	public String viewCount() {
		return "business/viewCount";
	}
	
	@GetMapping("create")
	public String businessStartPage() {
		return "business/businessInfo";
	}
	
	// 별점순 
	@GetMapping("gradeRanking")
	public ModelAndView BusinessGradeView(ModelAndView mv, HttpSession session) {
		
		Town townInfo = (Town)session.getAttribute("townInfo");
		List<Business> bList = bService.selectGradebList(townInfo);
		List<News> nList = bService.selectnList(townInfo);	
		List<Review> rList = bService.selectrList();
		mv.addObject("color",1);
		mv.addObject("bList",bList);
		mv.addObject("nList",nList);
		mv.addObject("rList",rList);
		mv.setViewName("business/myNear");
		return mv;
	}
	
	
	// 후기순
	@GetMapping("reviewRanking")
	public ModelAndView BusinessReviewView(ModelAndView mv, HttpSession session) {
		
		Town townInfo = (Town)session.getAttribute("townInfo");
		List<Business> bList = bService.selectReviewbList(townInfo);
		List<News> nList = bService.selectnList(townInfo);	
		List<Review> rList = bService.selectrList();
		mv.addObject("color",2);
		mv.addObject("bList",bList);
		mv.addObject("nList",nList);
		mv.addObject("rList",rList);
		mv.setViewName("business/myNear");
		return mv;
	}

	@GetMapping("job/list")
	public ModelAndView BusinessJobView(ModelAndView mv, HttpSession session) {
		Town townInfo = (Town)session.getAttribute("townInfo");
		List<News> nList = bService.selectJobnList(townInfo);
		mv.addObject("nList",nList);
		mv.addObject("category","일자리");
		mv.setViewName("business/cateNear");
		return mv;
	}
	@GetMapping("study/list")
	public ModelAndView BusinessStudyView(ModelAndView mv, HttpSession session) {
		Town townInfo = (Town)session.getAttribute("townInfo");
		List<News> nList = bService.selectStudynList(townInfo);
		mv.addObject("nList",nList);
		mv.addObject("category","과외");
		mv.setViewName("business/cateNear");
		return mv;
	}
	@GetMapping("fruit/list")
	public ModelAndView BusinessFruitView(ModelAndView mv, HttpSession session) {
		Town townInfo = (Town)session.getAttribute("townInfo");
		List<News> nList = bService.selectFruitnList(townInfo);
		mv.addObject("nList",nList);
		mv.addObject("category","농수산물");
		mv.setViewName("business/cateNear");
		return mv;
	}
	@GetMapping("house/list")
	public ModelAndView BusinessHouseView(ModelAndView mv, HttpSession session) {
		Town townInfo = (Town)session.getAttribute("townInfo");
		List<News> nList = bService.selectHousenList(townInfo);
		mv.addObject("nList",nList);
		mv.addObject("category","부동산");
		mv.setViewName("business/cateNear");
		return mv;
	}
	@GetMapping("car/list")
	public ModelAndView BusinessCarView(ModelAndView mv, HttpSession session) {
		Town townInfo = (Town)session.getAttribute("townInfo");
		List<News> nList = bService.selectCarnList(townInfo);
		mv.addObject("nList",nList);
		mv.addObject("category","중고차");
		mv.setViewName("business/cateNear");
		return mv;
	}
	@GetMapping("event/list")
	public ModelAndView BusinessEventView(ModelAndView mv, HttpSession session) {
		Town townInfo = (Town)session.getAttribute("townInfo");
		List<News> nList = bService.selectEventnList(townInfo);
		mv.addObject("nList",nList);
		mv.addObject("category","전시");
		mv.setViewName("business/cateNear");
		return mv;
	}
	@GetMapping("company/list")
	public ModelAndView BusinessCompanyView(ModelAndView mv, HttpSession session) {
		Town townInfo = (Town)session.getAttribute("townInfo");
		List<News> nList = bService.selectCompanynList(townInfo);
		mv.addObject("nList",nList);
		mv.addObject("category","지역업체");
		mv.setViewName("business/cateNear");
		return mv;
	}
}
