package com.kh.goodbuy.admin.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodbuy.center.model.service.NoticeService;
import com.kh.goodbuy.center.model.vo.Notice;
import com.kh.goodbuy.member.model.service.MemberService;
import com.kh.goodbuy.member.model.vo.Member;





@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MemberService mService;
	@Autowired
	private NoticeService nService;
	// 관리자 페이지 메인페이지 이동
	@GetMapping("/join")
	public String AdminMainView() {
		return "admin/admin_main";
	}

	// 공지사항
	// -------------------------------------------------------------------------------------------

	// 관리자 공지사항 메인페이지 이동
	@GetMapping("/notice")

		public ModelAndView NoticeMainView(ModelAndView mv) {
		       List<Notice> list = nService.selectNoticeList();
		       if(list != null) {
		          mv.addObject("list", list);
		          mv.setViewName("admin/notice_main");
		       } else {
		          mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
		          mv.setViewName("common/error_page");
		       }
		       return mv;
		
		
	}

	// 관리자 공지사항 작성페이지 이동
	@GetMapping("/noticecreate")
	 public String NoticeCreateView(@ModelAttribute Notice n, 
		                 @RequestParam(name="uploadFile") MultipartFile file,
		                 HttpServletRequest request) {
		System.out.println("공지사항 작성 내용 : " + n);
		
		
		// * 2) DB에 Notice 객체 insert
		int result = nService.insertNotice(n);
		
		if(result > 0) {
		  return "redirect:/admin/notice";
		} else {
		  throw new NoticeException("공지사항 등록에 실패하였습니다.");
		}
		
		
		
		
	
	}

	// 관리자 공지사항 디테일페이지 이동
	/*@GetMapping("/noticedetail")
	 public String NoticeDetailView(int nt_no,
                 HttpServletRequest request,
                 HttpServletResponse response,
                 Model model) {

		boolean flagnlist = false; // nlist라는 이름의 쿠키가 있는지 확인
		boolean flagnt_no = false; // 해당 bid가 포함 되어 있는지 확인
		
		Cookie[] cookies = request.getCookies();
		
		try {
		   if (cookies != null) {
		      for (Cookie c : cookies) {
		         // 읽은 게시글의 bid를 모아서 보관하는 blist가 쿠키 안에 있다면
		         if (c.getName().equals("blist")) {
		        	 flagnt_no = true;
		            // 기존 쿠키 값 먼저 읽어옴
		            String blist = URLDecoder.decode(c.getValue(), "UTF-8");
		            // , 구분자 기준으로 나누기
		            String[] list = nlist.split(",");
		            for(String st:list) {
		               // 쿠키 안에 지금 클릭한 게시글의 bid가 들어있다면 => 읽었음을 표시
		               if(st.equals(String.valueOf(nt_no))) flagnt_no = true;
		            }
		            if(!flagnt_no) { // 게시글을 읽지 않았다면 
		               c.setValue(URLEncoder.encode(nlist + "," + nt_no, "UTF-8"));
		               response.addCookie(c); // 응답에 담아 보냄 
		            }
		         }
		      }
		      if(!flagnlist) {
		         // blist라는 쿠키가 만들어지지 않은 경우
		         Cookie c1 = new Cookie("nlist", URLEncoder.encode(String.valueOf(nt_no), "UTF-8"));
		         response.addCookie(c1);
		      }
		   }
		
		} catch (UnsupportedEncodingException e) {
		   e.printStackTrace();
		}

		// flagbid가 true이면 읽은 글, flagbid가 false이면 읽지 않은 글 
		// !flagbid를 전달하여 true이면 조회수 증가 필요, flase이면 조회수 증가 불필요 
		Notice n = nService.selectNotice(nt_no, !flagnt_no);
		
		
		
		if(b != null) {
		   model.addAttribute("Notice", n);

		   return "admin/notice_detail";
		} else {
		   model.addAttribute("msg", "게시글 상세보기에 실패했습니다.");
		   return "common/errorpage";
		}

		
		
		
		
	
	}*/

	// 신고
	// -------------------------------------------------------------------------------------------
	// 신고 메인페이지 이동
	@GetMapping("/report")
	public String ReportMainView() {
		return "admin/report_main";
	}

	// 신고 메인페이지 이동
	@GetMapping("/reportdetail")
	public String ReportDetailView() {
		return "admin/report_detail";
	}

	// 상품관리
	// -------------------------------------------------------------------------------------------
	// 상품관리 메인페이지 이동
	@GetMapping("/product")
	public String ProductMainView() {
		return "admin/product_main";
	}

	// 상품관리 디테일 페이지 이동
	@GetMapping("/productdetail")
	public String ProductDetailView() {
		return "admin/product_detail";
	}

	// 회원관리
	// -------------------------------------------------------------------------------------------
	// 회원관리 메인페이지 이동
	@GetMapping("/member")
	public ModelAndView MemberMainView(ModelAndView mv) {
	       List<Member> list = mService.selectMemberList();
	       System.out.println(list);
	       if(list != null) {
	          mv.addObject("list", list);
	          mv.setViewName("admin/member_main");
	       } else {
	          mv.addObject("msg", "회원 목록 조회에 실패하였습니다.");
	          mv.setViewName("common/error_page");
	       }
	       return mv;

		
	}

	// 회원관리 디테일페이지 이동
	@GetMapping("/memberdetail")
	public String MemberDetailView() {
		return "admin/member_detail";
	}

	// FAQ 관리
	// -------------------------------------------------------------------------------------------
	// FAQ 메인페이지 이동
	@GetMapping("/FAQ")
	public String FAQrMainView() {
		return "admin/FAQ_main";
	}

	// 회원관리 디테일페이지 이동
	@GetMapping("/FAQdetail")
	public String FAQDetailView() {
		return "admin/FAQ_detail";
	}

	// 통계
	// -------------------------------------------------------------------------------------------
	// 통계1 페이지 이동
	@GetMapping("/stats")
	public String stats1View() {
		return "admin/stats1";
	}

	// 통계2 페이지 이동
	@GetMapping("/stats2")
	public String stats2View() {
		return "admin/stats2";
	}
}
