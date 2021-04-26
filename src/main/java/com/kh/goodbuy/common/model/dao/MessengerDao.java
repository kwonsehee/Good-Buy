package com.kh.goodbuy.common.model.dao;

import java.util.List;

import com.kh.goodbuy.common.model.vo.Messenger;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.PageInfo;

public interface MessengerDao {
	//사용자에게 msg보내기(상품관련)
	int insertMsg(String mcontent, Goods g, String caller);

	int selectMsgCount(String user_id);

	List<Messenger> selectMsgList(String user_id, PageInfo pi);

	Messenger selectOneMsg(int mno);

	int insertMsg2(Messenger msg);
	//seller에게 쪽지보내기
	int insertMsgUser(String mcontent, String user_id, String seller);
}
