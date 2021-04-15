package com.kh.goodbuy.common.model.dao;

import com.kh.goodbuy.goods.model.vo.Goods;

public interface MessengerDao {
	//사용자에게 msg보내기(상품관련)
	int insertMsg(String mcontent, Goods g, String caller);
}
