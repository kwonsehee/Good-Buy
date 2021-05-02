package com.kh.goodbuy;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.goodbuy.common.model.vo.Keyword;
import com.kh.goodbuy.goods.model.service.GoodsService;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.NaverLoginBO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
	private GoodsService gService;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        
        
        goodsRankList(model);
        
        bestKeyword(model);

        /* 생성한 인증 URL을 View로 전달 */
		return "home";
	}
	
	public String goodsRankList(Model model) {
		
		List<Goods> glist = gService.selectGoodsRankList();
		
		//System.out.println("인기 리스트 : " + glist);
		
		model.addAttribute("glist",glist);
		
		return "home";
	}
	
	public String bestKeyword(Model model) {
		
		List<Keyword> klist = gService.selectBestKeyword();
		
		model.addAttribute("klist",klist);
		
		return "home";
	}
	
	
	
}
