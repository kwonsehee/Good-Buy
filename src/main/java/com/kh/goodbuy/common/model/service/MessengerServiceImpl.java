package com.kh.goodbuy.common.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodbuy.common.model.dao.MessengerDao;
import com.kh.goodbuy.goods.model.vo.Goods;

@Service
public class MessengerServiceImpl implements MessengerService{
	@Autowired
	private MessengerDao msgDao;

	@Override
	public int insertMsg(String mcontent, Goods g, String caller) {
		// TODO Auto-generated method stub
		return msgDao.insertMsg(mcontent, g, caller);
	}
}
