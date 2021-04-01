package com.kh.goodbuy.center.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/center")
public class CenterController {
	
	// 고객센터 페이지 이동
	@GetMapping("/join")
	public String CenterMainView() {
		return "center/center_main";
	}
	@GetMapping("/FAQ")
	public String CenterFAQView() {
		return "center/center_FAQ";
	}
	@GetMapping("/QNA")
	public String CenterQNAView() {
		return "center/center_QNA";
	}
	@GetMapping("/QNA_Q")
	public String CenterQNAQView() {
		return "center/center_QNA_Q";
	}
	@GetMapping("/QNA_A")
	public String CenterQNAAView() {
		return "center/center_QNA_A";
	}
}
