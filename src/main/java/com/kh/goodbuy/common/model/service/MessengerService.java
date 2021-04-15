package com.kh.goodbuy.common.model.service;

import com.kh.goodbuy.goods.model.vo.Goods;

public interface MessengerService {

	//사용자에게 msg보내기(상품관련)
	int insertMsg(String mcontent, Goods g, String string);

}
