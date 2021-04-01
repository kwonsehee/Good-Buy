package com.kh.goodbuy.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

	// 관리자 페이지 메인페이지 이동
	@GetMapping("/join")
	public String AdminMainView() {
		return "admin/admin_main";
	}

	// 공지사항
	// -------------------------------------------------------------------------------------------

	// 관리자 공지사항 메인페이지 이동
	@GetMapping("/notice")
	public String NoticeMainView() {
		return "admin/notice_main";
	}

	// 관리자 공지사항 작성페이지 이동
	@GetMapping("/noticecreate")
	public String NoticeCreateView() {
		return "admin/notice_create";
	}

	// 관리자 공지사항 디테일페이지 이동
	@GetMapping("/noticedetail")
	public String NoticeDetailView() {
		return "admin/notice_detail";
	}

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
	public String MemberMainView() {
		return "admin/member_main";
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
