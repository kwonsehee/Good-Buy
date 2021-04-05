package com.kh.goodbuy.center.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.goodbuy.center.model.service.NoticeService;
import com.kh.goodbuy.center.model.vo.Notice;




@Controller
@RequestMapping("/center")
public class CenterController {
	@Autowired
	private NoticeService nService;
	// 고객센터 페이지 이동
	@GetMapping("/join")
	public ModelAndView CenterMainView(ModelAndView mv) {
		       List<Notice> list = nService.selectNoticeList();
		       if(list != null) {
		          mv.addObject("list", list);
		          mv.setViewName("center/center_main");
		       } else {
		          mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
		          mv.setViewName("common/error_page");
		       }
		       return mv;
		
		
		
		
		
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
