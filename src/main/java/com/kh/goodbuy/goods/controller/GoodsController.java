package com.kh.goodbuy.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goodbuy.goods.model.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	// 중고상품 리스트 페이지로
	@GetMapping("/list")
	public String goGoodsView() {
		return "goods/goodslist";
	}

	// 내가 등록한 중고상품 리스트 페이지로
	@GetMapping("/mylist")
	public String goMyGoodsView() {
		return "goods/myglist";
	}

	// 중고상품등록 페이지로
	@GetMapping("/insert")
	public String goGoodsInsertView() {
		return "goods/goodsinsert";
	}

	// 중고상품detail 페이지로
	@GetMapping("/detail")
	public String goGoodsDetailView() {
		return "goods/goodsdetail";
	}
	// 내 중고상품detail 페이지로
	@GetMapping("/mydetail")
	public String goGoodsmyDetailView() {
		return "goods/mygoodsdetail";
	}
	// 판매자 정보 페이지로
	@GetMapping("/sellerInfo")
	public String gosellerInfoView() {
		return "goods/sellerInfo";
	}

	// 판매자 following 페이지로
	@GetMapping("/sellerfollowing")
	public String gosellerfollowingView() {
		return "goods/sellerfollowing";
	}
	// 판매자에게 메세지 보내는 팝업 페이지로
	@GetMapping("/sendToseller")
	public String gosendmsgView() {
		return "goods/sendToseller";
	}
	// 판매자에게 메세지 보내는 팝업 페이지로
		@GetMapping("/sendmsgPopup")
		public String gosendmsgPopupView() {
			return "goods/sendmsgPopup";
		}
}
