package com.kh.goodbuy.common.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodbuy.common.model.dao.MessengerDao;
import com.kh.goodbuy.common.model.vo.Messenger;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.PageInfo;

@Service
public class MessengerServiceImpl implements MessengerService{
	@Autowired
	private MessengerDao msgDao;

	@Override
	public int insertMsg(String mcontent, Goods g, String caller) {
		// TODO Auto-generated method stub
		return msgDao.insertMsg(mcontent, g, caller);
	}

	@Override
	public int selectMsgCount(String user_id) {
		return msgDao.selectMsgCount(user_id);
	}

	@Override
	public List<Messenger> selectMsgList(String user_id, PageInfo pi) {
		return msgDao.selectMsgList(user_id,pi);
	}

	@Override
	public Messenger selectOneMsg(int mno) {
		return msgDao.selectOneMsg(mno);
	}

	@Override
	public int insertMsg2(Messenger msg) {
		return msgDao.insertMsg2(msg);
	}

	@Override
	public int insertMsgUser(String mcontent, String user_id, String seller) {
		// TODO Auto-generated method stub
		return msgDao.insertMsgUser(mcontent, user_id, seller);
	}

	@Override
	public int selectUserMsgCount(String user_id) {
		return msgDao.selectUserMsgCount("selectUserMsgCount",user_id);
	}

	@Override
	public List<Messenger> selectUserMsgList(String user_id, PageInfo pi) {
		return msgDao.selectUserMsgList(user_id,pi);
	}

	@Override
	public Messenger selectOneMsg2(int mno) {
		return msgDao.selectOneMsg2(mno);
	}

	@Override
	public int insertMsgUser2(Messenger msg) {
		return msgDao.insertMsgUser2(msg);
	}
}
