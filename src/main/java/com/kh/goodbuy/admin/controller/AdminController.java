package com.kh.goodbuy.admin.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodbuy.admin.model.service.ReportService;
import com.kh.goodbuy.admin.model.vo.Report;
import com.kh.goodbuy.center.model.service.NoticeService;
import com.kh.goodbuy.center.model.service.QnaService;
import com.kh.goodbuy.center.model.vo.Notice;
import com.kh.goodbuy.center.model.vo.QNA;
import com.kh.goodbuy.common.Pagination;
import com.kh.goodbuy.member.model.service.MemberService;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.member.model.vo.Search;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MemberService mService;
	@Autowired
	private NoticeService nService;
	@Autowired
	private ReportService rService;
	@Autowired
	private QnaService qService;

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
		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("admin/notice_main");
		} else {
			mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error_page");
		}
		return mv;

	}

	// 공지사항 등록 화면이동
	@GetMapping("/write")
	public String NoticeWriteView() {
		return "admin/notice_create";
	}

	// 관리자 공지사항 작성버튼
	@PostMapping("/noticewrite")
	public String NoticeCreateView(@ModelAttribute Notice n, HttpServletRequest request) {
		System.out.println("공지사항 작성 내용 : " + n);

		// * 2) DB에 Notice 객체 insert
		int result = nService.insertNotice(n);
		System.out.println(result);
		if (result > 0) {
			return "redirect:/admin/notice";
		} else {
			throw new NoticeException("공지사항 등록에 실패하였습니다.");
		}

	}

	// 공지사항 수정
	@PostMapping("/update")
	public String noticeUpdate(@ModelAttribute Notice n, HttpServletRequest request) {

		int result = nService.updateNotice(n);

		if (result > 0) {
			return "redirect:/admin/notice";
		} else {
			throw new NoticeException("공지사항 수정에 실패하였습니다.");
		}

	}

	// 공지사항 삭제
	@GetMapping("/delete")
	public String noticeDelete(int nt_no, HttpServletRequest request) {

		Notice n = nService.selectNotice(nt_no);
		int result = nService.deleteNotice(nt_no);

		if (result > 0) {
			return "redirect:/admin/notice";
		} else {
			throw new NoticeException("공지사항 삭제에 실패하였습니다.");
		}
	}

	// 관리자 공지사항 디테일페이지 이동
	@GetMapping("/noticedetail")
	public String NoticeDetailView(@RequestParam int nt_no, Model model) {

		Notice n = nService.selectNotice(nt_no);

		if (n != null) {
			model.addAttribute("notice", n);
			return "admin/notice_detail";
		} else {
			model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
			return "common/errorpage";
		}
	}

	// 신고
	// -------------------------------------------------------------------------------------------
	// 신고 메인페이지 이동
	@GetMapping("/report")
	public ModelAndView ReportMainView(ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage) {

		int listCount = rService.selectListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<Report> list = rService.selectReportList(pi);
		System.out.println(listCount);
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("admin/report_main");
		} else {
			mv.addObject("msg", "회원 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error_page");
		}
		return mv;
	}

	// 신고 메인페이지 이동
	@GetMapping("/reportdetail")
	public String ReportDetailView(@RequestParam int re_no, Model model) {

		Report r = rService.selectReport(re_no);

		if (r != null) {
			model.addAttribute("report", r);
			return "admin/report_detail";
		} else {
			model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
			return "common/errorpage";
		}
	}

	// 신고 상세페이지에서 처리하기
	@PostMapping("/reportupdate")
	public String reportUpdate(@ModelAttribute Report r, HttpServletRequest request) {

		int result = rService.updateReport(r);

		if (result > 0) {
			return "redirect:/admin/report";
		} else {
			throw new NoticeException("신고처리에 실패하였습니다.");
		}

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
	public ModelAndView MemberMainView(ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage) {

		int listCount = mService.selectListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<Member> list = mService.selectMemberList(pi);
		System.out.println(listCount);
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("admin/member_main");
		} else {
			mv.addObject("msg", "회원 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error_page");
		}
		return mv;

	}

	// 회원관리 디테일페이지 이동
	@GetMapping("/memberdetail")
	public String MemberDetailView(@RequestParam String user_id, Model model) {

		Member m = mService.selectMemberDetail(user_id);

		if (m != null) {
			model.addAttribute("member", m);
			return "admin/member_detail";
		} else {
			model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
			return "common/errorpage";
		}
	}

	@PostMapping("/memberupdate")
	public String memberUpdate(@ModelAttribute Member m, HttpServletRequest request) {

		int result = mService.updateMember(m);
		System.out.println(m);

		if (result > 0) {
			return "redirect:/admin/member";
		} else {
			throw new NoticeException("회원정보 수정에 실패하였습니다.");
		}

	}

	// 검색 기능

	@GetMapping("/search")
	public String memberSearch(@ModelAttribute Search search, Model model) {
		// 체크 박스가 체크 된 경우 on
		// 체크 박스가 체크 되지 않은 경우 null
		List<Member> searchList = mService.searchList(search);

		model.addAttribute("list", searchList);
		return "admin/member_main";
	}

	// FAQ 관리
	// -------------------------------------------------------------------------------------------
	// FAQ 메인페이지 이동
	@GetMapping("/FAQ")
	public ModelAndView FAQMainView(ModelAndView mv) {
		List<QNA> list = qService.selectQNAList();
		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("admin/FAQ_main");
		} else {
			mv.addObject("msg", "FAQ 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error_page");
		}
		return mv;

	}

	// FAQ 등록 화면이동
	@GetMapping("/FAQwrite")
	public String FAQWriteView() {
		return "admin/FAQ_create";
	}

	// FAQ 등록 작성버튼
	@PostMapping("/FAQwritebtn")
	public String FAQCreateView(@ModelAttribute QNA q, HttpServletRequest request) {

		int result = qService.insertQNA(q);

		if (result > 0) {
			return "redirect:/admin/FAQ";
		} else {
			throw new NoticeException("FAQ 등록에 실패하였습니다.");
		}

	}

	// FAQ 디테일페이지 이동
	@GetMapping("/FAQdetail")

	public String FAQDetailView(@RequestParam int qa_no, Model model) {

		QNA q = qService.selectQNA(qa_no);

		if (q != null) {
			model.addAttribute("qna", q);
			return "admin/FAQ_detail";
		} else {
			model.addAttribute("msg", "FAQ 보기에 실패했습니다.");
			return "common/errorpage";
		}
	}

	// FAQ 수정
	@PostMapping("/FAQupdate")
	public String FAQUpdate(@ModelAttribute QNA q, HttpServletRequest request) {

		int result = qService.updateFAQ(q);
		if (result > 0) {
			return "redirect:/admin/FAQ";
		} else {
			throw new NoticeException("FAQ 수정에 실패하였습니다.");
		}

	}

	// FAQ 삭제
	@GetMapping("/deleteFAQ")
	public String FAQDelete(int qa_no, HttpServletRequest request) {

		QNA q = qService.selectQNA(qa_no);
		int result = qService.deleteQNA(qa_no);
		System.out.println(result);
		
		if (result > 0) {
			
			return "redirect:/admin/FAQ";
		} else {
			throw new NoticeException("FAQ 삭제에 실패하였습니다.");
		}
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
