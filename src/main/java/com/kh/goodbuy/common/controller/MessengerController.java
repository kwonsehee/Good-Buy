package com.kh.goodbuy.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goodbuy.common.model.service.MessengerService;
import com.kh.goodbuy.common.model.vo.Messenger;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.Member;

@Controller
@RequestMapping("/msg")
public class MessengerController {

	@Autowired
	private MessengerService msgService;

	// 상품관련 메세지 보내기
	@PostMapping("/goodsinsert")
	public String goGoodsView(HttpServletRequest request, String mcontent,
			Model model) {
		System.out.println("r : " + mcontent);
		Goods g = (Goods) request.getSession().getAttribute("g");
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		int result = msgService.insertMsg(mcontent, g, loginUser.getUser_id());
		if(result>0) {
			model.addAttribute("msg", "success");
		}else {
			
			model.addAttribute("msg", "fail");
		}
		
		return "goods/sendmsgPopup";
	}
	
	@PostMapping("/insertMsg")
	public String insertMsg(HttpServletRequest request,
							String mcontent, 
							String caller, 
							int gno,
							Model model) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		Messenger msg = new Messenger();
		msg.setReceiver(caller);
		msg.setCaller(loginUser.getUser_id());
		msg.setMcontent(mcontent);
		msg.setGno(gno);
		
		
		int result = msgService.insertMsg2(msg);
		
		if(result > 0) {
			model.addAttribute("msg","success");
		}else {
			model.addAttribute("msg", "fail");
		}
		
		return "mypage/msgList";
	}
	
	
	
	
}
