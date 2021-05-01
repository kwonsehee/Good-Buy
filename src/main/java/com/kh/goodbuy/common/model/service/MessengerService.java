package com.kh.goodbuy.common.model.service;

import java.util.List;

import com.kh.goodbuy.common.model.vo.Messenger;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.PageInfo;

public interface MessengerService {

	//사용자에게 msg보내기(상품관련)
	int insertMsg(String mcontent, Goods g, String string);
	// 내 쪽지함 리스트 카운트
	int selectMsgCount(String user_id);
	// 내 쪽지함 리스트
	List<Messenger> selectMsgList(String user_id, PageInfo pi);
	// 받은 쪽지 한개 조회
	Messenger selectOneMsg(int mno);
	// msg답장보내기
	int insertMsg2(Messenger msg);
	//seller에게 쪽지보내기
	int insertMsgUser(String mcontent, String user_id, String seller);
	// 판매자  쪽지 리스트 카운트 
	int selectUserMsgCount(String user_id);
	// 판매자 쪽지 리스트 
	List<Messenger> selectUserMsgList(String user_id, PageInfo pi);
	// 판매자 쪽지 답장할때 셀렉
	Messenger selectOneMsg2(int mno);
	// 판매자 쪽지 답장
	int insertMsgUser2(Messenger msg);

}
