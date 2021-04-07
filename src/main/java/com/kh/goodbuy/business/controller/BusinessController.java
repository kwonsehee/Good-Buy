package com.kh.goodbuy.business.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodbuy.business.model.service.BusinessService;
import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;

@Controller
@RequestMapping("/business")
public class BusinessController {
	@Autowired
	private BusinessService bService;
	
	// 내 근처 페이지
	@GetMapping("/list")
	public String BusinessView(ModelAndView mv) {
		List<Business> bList = bService.selectbList();
		List<Attachment> fList = bService.selectfList();
		List<Attachment> nfList = bService.selectnfList();
		List<News> nList = bService.selectnList();
		
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
	
	

}
