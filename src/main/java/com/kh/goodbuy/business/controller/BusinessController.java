package com.kh.goodbuy.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/business")
public class BusinessController {
	
	// 내 근처 페이지
	@GetMapping("/list")
	public String BusinessView() {
		return "business/myNear";
	}
	
	// 내 근처 소식 전체 보기
	@GetMapping("/near/list")
	public String BusinessNearView() {
		return "business/cateNear";
	}
	
	// 비즈니스 상세페이지
	@GetMapping("/detail")
	public String BusinessDetailView() {
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
	

}
