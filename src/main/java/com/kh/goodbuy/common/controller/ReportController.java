package com.kh.goodbuy.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.goodbuy.common.model.service.ReportService;
import com.kh.goodbuy.common.model.vo.Report;
import com.kh.goodbuy.member.model.vo.Member;

@Controller
@RequestMapping("/report")
@SessionAttributes({ "msg" })
public class ReportController {
	@Autowired
	private ReportService rService;

	// 중고상품 신고
	@PostMapping("/goodsinsert")
	public String goGoodsView(HttpServletRequest request,
			@RequestParam(value = "gno", required = false) int gno,
			@RequestParam(value = "reported_id", required = false) String reported_id,
			@ModelAttribute Report r, Model model) {
		System.out.println("r : " + r);
		System.out.println("gno : " + gno);
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		r.setReport_id(loginUser.getUser_id());
		r.setReported_id(reported_id);
		
		System.out.println("신고자(로그인유저) : " + loginUser.getUser_id());
		System.out.println("신고대상자(글쓴이) : " + reported_id);
		
		int result = rService.insertGoodsReport(r, gno, loginUser.getUser_id(), reported_id);
		if(result>0) {
			
			model.addAttribute("msg", "success");
		}else {
			
			model.addAttribute("msg", "fail");
		}
		model.addAttribute("gno",gno);
		return "redirect:/goods/detail";
	}
	
	
	// 신고 철회
	@GetMapping("/deleteReport")
	public String deleteReport(int re_no, @ModelAttribute("loginUser") Member loginUser) {
		System.out.println("re_no : " + re_no);
		
		int result = rService.deleteReport(re_no);
		
		System.out.println("신고철회 됨? " + result);
		
		if(result > 0) {
			return "redirect:/mypage/reportList";
		} else {
			return "common/errorpage";
		}
		
	}
	
}
