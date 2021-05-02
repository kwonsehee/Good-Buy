package com.kh.goodbuy.business.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.goodbuy.business.model.service.BusinessService;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;
import com.kh.goodbuy.business.model.vo.Payment;
import com.kh.goodbuy.business.model.vo.Review;
import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.member.model.service.MemberService;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.town.model.vo.Town;

@Controller
@RequestMapping("/business")
@SessionAttributes({ "msg"})
public class BusinessController {
	@Autowired
	private BusinessService bService;
	@Autowired
	private MemberService mService;
	
	// 내 근처 페이지
	@GetMapping("/list")
	public ModelAndView BusinessView(ModelAndView mv, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUser_id();
		Town townInfo = (Town)session.getAttribute("townInfo");

		
		

		List<Business> bList = bService.selectbList(townInfo);
		List<News> nList = bService.selectnList(townInfo);		
		//List<Attachment> fList = bService.selectfList();
		//List<NewsAttachment> nfList = bService.selectnfList();
		List<Review> rList = bService.selectrList();
		mv.addObject("color",0);
		mv.addObject("bList",bList);
		mv.addObject("nList",nList);
		//mv.addObject("fList",fList);
		//mv.addObject("nfList",nfList);
		mv.addObject("rList",rList);
		System.out.println(bList);
		System.out.println(nList);
	//	System.out.println(fList);
		//System.out.println(nfList);
		System.out.println(townInfo);
		System.out.println(rList);
	   	 Member loginUser2 = mService.loginMember(loginUser);
	   	 mv.addObject("loginUser", loginUser2);
		mv.setViewName("business/myNear");
		
		

		return mv;
		
	}
	

	
	// 비즈니스 상세페이지
	@GetMapping("/detail")
	public String BusinessDetailView(int shopNo,
									HttpServletRequest request,
									HttpServletResponse response,
									Model model, HttpSession session) {
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
		 
		 Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUser_id();
		String shopNo2 = Integer.toString(shopNo);
		
		Map<String, String > map = new HashMap<>();
		map.put("userId", userId);
		map.put("shopNo", shopNo2);
		 Business b = bService.selectDetail(shopNo, !flagshopNo);
		 List<News> nList= bService.selectDetailNews(shopNo);
		 List<Review> rList = bService.selectDetailReview(shopNo);
		 int faCount = bService.selectFaUserList(map);
		 model.addAttribute("business",b);
		 model.addAttribute("news",nList);
		 model.addAttribute("rList",rList);
		 model.addAttribute("faCount",faCount);
		 System.out.println("b: " +b);
		 System.out.println("n: " +nList);
		 System.out.println("rList : " + rList);
		 

		 
		return "business/businessDetail";
	}
	
	// 비즈니스 설정페이지
	@GetMapping("/change")
	public String BusinessSetting(Model model, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId= loginUser.getUser_id();
		
		Business b = bService.selectBusinessInfo(userId);
		int shopNo = bService.selectshopNo(userId);
		List<News> nList = bService.selectNews(shopNo);
		model.addAttribute("b",b);
		model.addAttribute("nList",nList);
		System.out.println("여기"+nList);
		
		
		return "business/businessChange";
	}
	
	@PostMapping("/insert")
	public String BusinessInsert(@ModelAttribute Business b, MultipartFile file, @ModelAttribute Addfile a,
								Model model,
								HttpServletRequest request,
								HttpSession session) {
		
			Member loginUser = (Member)session.getAttribute("loginUser");
			String userId= loginUser.getUser_id();
			Town townInfo = (Town)session.getAttribute("townInfo");
			int tNo = townInfo.getT_no();
			
	
			
			   // 업로드 파일 서버에 저장
		      // 파일이 첨부 되었다면
		      if(!file.getOriginalFilename().equals("")) {
		         // 파일 저장 메소드 별도로 작성 - 리네임 리턴 
		         String renameFileName = saveFile(file, request);
		         // DB에 저장하기 위한 파일명 세팅
		         if(renameFileName != null) {
		            a.setOriginName(file.getOriginalFilename());
		            a.setChangeName(renameFileName);
		            a.setFile_level(1);
		           
		         }
		         
		      }
		     
			 b.setUserId(userId);
	         b.setTNo(tNo);
	         int result = bService.infoInsert(b,a);
	         
	         System.out.println(result);
	         
	         if(result > 0) {
	        	 int result2 = bService.updateBstatus(userId);
	        	 System.out.println("result2" +result2);
	        	 return "redirect:/business/list";
	         }else {
	        	 System.out.println("실패");
	         }
	         return "redirect:/business/list";
	}

	
	
	 @PostMapping("/update") 
	 public String businessUpdate(@ModelAttribute Business
			 	b, MultipartFile file, @ModelAttribute Addfile a, 
			 	HttpServletRequest request,HttpSession session,Model model
			 				) {
	  
		 		Member loginUser = (Member)session.getAttribute("loginUser");
		 		String userId=loginUser.getUser_id();
		 		int shopNo = bService.selectshopNo(userId);
		 		
		 		System.out.println("업데이트b" + b);

	  	
	  

				   // 업로드 파일 서버에 저장
			      // 파일이 첨부 되었다면
			      if(!file.getOriginalFilename().equals("")) {
			         // 파일 저장 메소드 별도로 작성 - 리네임 리턴 
			         String renameFileName = saveFile(file, request);
			         // DB에 저장하기 위한 파일명 세팅
			         if(renameFileName != null) {
			            a.setOriginName(file.getOriginalFilename());
			            a.setChangeName(renameFileName);
			            a.setFile_level(1);
			           
			         }
			         
			      }

		         int result = bService.infoupdate(b,a);
		         
		         if(result > 0) {
		        	 int result2 = bService.updateBfile(shopNo);
		        	 return "redirect:/business/list";
		         }else {
		        	 System.out.println("실패");
		         }
		         return "redirect:/business/list";
	 
		 		
	  }
	 
	 
	
	@PostMapping("/news/insert")
	public String newsInsert(@ModelAttribute News n ,MultipartFile file, @ModelAttribute Addfile a,
			HttpServletRequest request, Model model
			,HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId= loginUser.getUser_id();
		Town townInfo = (Town)session.getAttribute("townInfo");
		int tNo = townInfo.getT_no();
		
		 // 업로드 파일 서버에 저장
	      // 파일이 첨부 되었다면
	      if(!file.getOriginalFilename().equals("")) {
	         // 파일 저장 메소드 별도로 작성 - 리네임 리턴 
	         String renameFileName = saveFile(file, request);
	         // DB에 저장하기 위한 파일명 세팅
	         if(renameFileName != null) {
	            a.setOriginName(file.getOriginalFilename());
	            a.setChangeName(renameFileName);
	            a.setFile_level(1);
	           
	         }
	         
	      }
	      int shopNo = bService.selectshopNo(userId);
		 n.setShopNo(shopNo);
		 n.setTNo(tNo);
       int result = bService.newsInsert(n,a);
       
       if(result > 0) {
    	   
    	   model.addAttribute("msg", "success");
      	 return "redirect:/business/newsWriter";
       }else {
    	   model.addAttribute("msg", "fail");
      	 return "redirect:/business/newsWriter";
       }
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
	      String root = request.getSession().getServletContext().getRealPath("resources");
	      String savePath = root + "/images/goodupload";
	      File folder = new File(savePath); // 메모리상에서 객체 파일 만들기 
	      if(!folder.exists()) folder.mkdir(); // -> 해당 경로가 존재하지 않는다면 디렉토리 생성
	      
	      // 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	      String originalFileName = file.getOriginalFilename();
	      String renameFileName = sdf.format(new Date()) + "_"
	                     + (int)(Math.random() * 100000)
	                     + originalFileName.substring(originalFileName.lastIndexOf("."));
	      
	      String renamePath = folder + "\\" + renameFileName; // 저장하고자하는 경로 + 파일명
	      
	      try {
	         file.transferTo(new File(renamePath));
	         // => 업로드 된 파일 (MultipartFile) 이 rename명으로 서버에 저장
	      } catch (IllegalStateException | IOException e) {
	         System.out.println("파일 업로드 에러 : " + e.getMessage());
	      }
	      
	      return renameFileName;
	   }
	
	@GetMapping("create")
	public String BusinessCreate() {
		return "business/businessInfo";
	}
	@GetMapping("setting")
	public String BusinessSetting() {
		return "business/businessSetting";
	}

	// 광고하기 페이지
	@GetMapping("/ad")
	public String adPage(Model model , HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId= loginUser.getUser_id();
		int shopNo = bService.selectshopNo(userId);
		Business b = bService.selectBusinessInfo(userId);
		int viewCnt = bService.selectViewCnt(shopNo);
		model.addAttribute("business",b);
		model.addAttribute("viewCnt",viewCnt);
		
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
	
	/*
	 * // 정보 관리 팝업 페이지
	 * 
	 * @PostMapping("infoSet") public String infoSet(@ModelAttribute Business b,
	 * HttpServletRequest request) {
	 * 
	 * System.out.println(b);
	 * 
	 * int result = bService.infoInsert(b);
	 * 
	 * return "business/businessSetting"; }
	 */
	
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
	
	@GetMapping("updateFaCount")
	public String updateFaCount(String shopNo,String buserId ,HttpSession session) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			String userId = loginUser.getUser_id();
			String nickName = loginUser.getNickname();
			Map<String, String> map = new HashMap<>();
			
			map.put("userId", userId);
			map.put("buserId", buserId);
			map.put("shopNo", shopNo);
			map.put("nickName", nickName);
			int result = bService.updateFacount(map);
			
		return "redirect:/business/detail?shopNo="+shopNo;
	}
	
	@GetMapping("deleteFaCount")
	public String deleteFaCount(String shopNo, HttpSession session,String pageName) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			String userId = loginUser.getUser_id();
			Map<String, String> map = new HashMap<>();
			map.put("userId", userId);
			map.put("shopNo", shopNo);
			
			int result = bService.deleteFacount(map);
			
			if(result > 0 && pageName.equals("mypage")) {
				return"redirect:/mypage/likeShopList";
			}else {
				return "redirect:/business/detail?shopNo="+shopNo;
			}
			
	}
	
	@GetMapping("delete")
	public String deleteBusiness( HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId= loginUser.getUser_id();
		int shopNo = bService.selectshopNo(userId);
		
		int result = bService.deleteBusiness(shopNo);
		int result2 = bService.updateBstatus2(userId);
		
		System.out.println("딜리트업뎃결과"+result2);
		return  "redirect:/business/list";
	}
	@PostMapping(value="/review/insert", produces="application/json; charset=utf-8")
	public @ResponseBody String reviewInsert(Review r, HttpSession session, HttpServletRequest request
											) {
		 // 글 작성자 loginUser에서 가져옴

	      Member loginUser = (Member)session.getAttribute("loginUser");
	      String userId = loginUser.getUser_id();
	      String grade = request.getParameter("grade");
	      String shopNo2 = request.getParameter("shopNo");
	      int shopNo = Integer.parseInt(shopNo2); 
	      String shopName = request.getParameter("shopName");
	      String buserId = request.getParameter("buserId");
	     
	      String content = request.getParameter("content");
	      System.out.println(grade);
	      r.setContent(content);
	      r.setGrade(grade);
	      r.setUserId(userId);
	      r.setShopName(shopName);
	      r.setBuserId(buserId);
	      // +rcontent, refBid 
	      System.out.println(shopName+"shopName");
	      System.out.println("buserId " + buserId);
	      // Service, Dao, board-mapper.xml 코드 추가
	      // Service -> 댓글 insert 후 댓글 select
	      List<Review> rlist = bService.insertReview(r);
	      int result = bService.updateUserPoint(userId);
	      
	      // 응답 작성 
	      // 날짜 포맷하기 위해 GsonBuilder를 이용해서 GSON 객체 생성
	      Gson gson = new GsonBuilder()
	               .setDateFormat("yyyy-MM-dd")
	               .create();
	      
	      return gson.toJson(rlist);
	}
	
	@PostMapping(value="/review/delete", produces="application/json; charset=utf-8")
	public @ResponseBody String reviewDelete(Review r, HttpSession session, HttpServletRequest request) {
		  
		  Member loginUser = (Member)session.getAttribute("loginUser");
	      String userId = loginUser.getUser_id();
	      
	      String reviewNo = request.getParameter("reviewNo");
	      String shopNo2 = request.getParameter("shopNo2");
	      int shopNo = Integer.parseInt(shopNo2);
	     System.out.println("이거 되는거니?");
	      // +rcontent, refBid 
	      
	      // Service, Dao, board-mapper.xml 코드 추가
	      // Service -> 댓글 insert 후 댓글 select
	      int result = bService.deleteReview(reviewNo);
	      // 응답 작성 
	      // 날짜 포맷하기 위해 GsonBuilder를 이용해서 GSON 객체 생성
	      Gson gson = new GsonBuilder()
	               .setDateFormat("yyyy-MM-dd")
	               .create();
	      
	      if(result > 0) {
	    	  
	    	  List<Review> rlist = bService.selectDetailReview(shopNo);
	    	  System.out.println("이거되냐?");
	    	  System.out.println(rlist + "딜리트");
	    	  return gson.toJson(rlist);
	    	  
	      }else {
	    	  return "business/list";
	      }

	      
	      
	     
	      
	      
		
	}
	
	@PostMapping(value="/news/delete", produces="application/json; charset=utf-8")
	public @ResponseBody String NewsDelete(News n, HttpSession session, HttpServletRequest request) {
		  
		  Member loginUser = (Member)session.getAttribute("loginUser");
	      String userId = loginUser.getUser_id();
	      String n_no2 = request.getParameter("n_no");
	      int n_no = Integer.parseInt(n_no2);
	      String shopNo2 = request.getParameter("shopNo");
	      int shopNo = Integer.parseInt(shopNo2);
	      int result = bService.deleteNews(n_no);
	      // 응답 작성 
	      // 날짜 포맷하기 위해 GsonBuilder를 이용해서 GSON 객체 생성
	      Gson gson = new GsonBuilder()
	               .setDateFormat("yyyy-MM-dd")
	               .create();
	      
	      if(result > 0) {
	    	  
	    	  List<News> nList = bService.selectNews(shopNo);
	    	  System.out.println("이거되냐?");
	    	  System.out.println(nList + "딜리트");
	    	  return gson.toJson(nList);
	    	  
	      }else {
	    	  return "business/list";
	      }

	      
	      
	     
	      
	      
		
	}
	
	
	@GetMapping("cash")
	public String cashInsert(int amount,HttpServletRequest request,HttpSession session,
			Model model, Payment p) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId= loginUser.getUser_id();
		int shopNo = bService.selectshopNo(userId);
		p.setShopNo(shopNo);
		p.setPayment(amount);
			int result = bService.cashInsert(p);
			if(result >0) {
				int result2 = bService.cashUpdate(p);
			}
		return "redirect:/business/ad";
	}
	
	@GetMapping("ad/create")
	public String adCreate(HttpSession session,int cash) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId= loginUser.getUser_id();
		int shopNo = bService.selectshopNo(userId);
		String shopNo2 = Integer.toString(shopNo);
		Map<String, Integer> map = new HashMap<>();
		int viewCnt = 0;
		if(cash == 5000) {
			viewCnt = 500;
		}else if(cash == 10000) {
			viewCnt = 1000;
		}else if(cash == 13000) {
			viewCnt = 1500;
		}else if(cash == 15000) {
			viewCnt = 2000;
		}
		map.put("viewCnt", viewCnt);
		map.put("cash", cash);
		map.put("shopNo", shopNo);
		int result = bService.updateCashUse(map);
		int result2 = bService.updateViewCnt(map);
		
		return "redirect:/business/ad";
	}
		
}
