package com.kh.goodbuy.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodbuy.common.model.vo.Keyword;
import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.common.model.vo.Report;
import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.member.model.dao.MemberDao;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.MyTown;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.member.model.vo.Search;



@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao mDao;
	
	@Override
	public Member loginMember(Member m) {
		// TODO Auto-generated method stub
		return mDao.selectMember(m);
	}
	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		
		return mDao.insertMember(m);
	}
	@Override
	public int insertMyTown(MyTown mt) {
		return  mDao.insertMember(mt);
	}
	
	@Override
	public int insertMember(ArrayList<Object> list) {
		return mDao.insertMember(list);
	}
	@Override
	public List<Member> selectMemberList(PageInfo pi) {
		// TODO Auto-generated method stub
		return mDao.selectList(pi);
	}
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return mDao.selectListCount();
	}
	@Override
	public List<Member> searchList(Search search) {
		// TODO Auto-generated method stub
		return mDao.searchList(search);
	}
	@Override
	public Member selectMemberDetail(String user_id) {
		// TODO Auto-generated method stub
		return mDao.selectMemberDetail(user_id);
	}
	@Override
	public int userIdCheck(String user_id) {
		return mDao.userIdCheck(user_id);
	}
	@Override
	public int updateMember(Member loginUser) {
		return mDao.updateMember(loginUser);
	}
	@Override

	public int updateUserPhoto(Member loginUser) {
		return mDao.updateUserPhoto(loginUser);
	}
	@Override
	public int deleteUserPhoto(Member loginUser) {
		return mDao.deleteUserPhoto(loginUser);
	}

	public int updateadminmember(Member m) {
		// TODO Auto-generated method stub
		return mDao.updateadminMember(m);
	}
	@Override
	public int updatePoint(String user_id, int user_point, int gno) {
		mDao.updatePoint(user_id, user_point);
		return mDao.insertDealPoint(user_id, user_point, gno);
	}
	@Override
	public int insertDeal(String user_id, int amount, int gno) {
		// TODO Auto-generated method stub
		return mDao.insertDeal(user_id, amount, gno);
	}
	@Override
	public String selectSellerPhoto(String user_id) {
		// TODO Auto-generated method stub
		return mDao.selectSellerPhoto(user_id);
	}
	@Override
	public int deleteMember(String user_id) {
		return	mDao.deleteMember(user_id);
	}
	@Override
	public int insertKeyword(Keyword k) {
		return mDao.insertKeyword(k);
	}
	@Override
	public List<Keyword> selectKeyword(String user_id) {
		return mDao.selectKeyword(user_id);
	}
	@Override
	public List<Reply> selectReplyList(String user_id, PageInfo pi) {
		return mDao.selectReplyList(user_id, pi);
	}
	@Override
	public int selectReplyCount(String user_id) {
		return mDao.selectReplyCount(user_id);
	}
	@Override
	public int deleteReply(Reply r) {
		return mDao.deleteReply(r);
	}
	@Override
	public int insertFollow(String user_id, String seller) {
		// TODO Auto-generated method stub
		return mDao.insertFollow(user_id, seller);
	}
	@Override
	public int isFollow(String seller, String user_id) {
		// TODO Auto-generated method stub
		return mDao.isFollow(seller, user_id);
	}
	@Override
	public int canselFollow(String user_id, String seller) {
		// TODO Auto-generated method stub
		return mDao.canselFollow(user_id, seller);
	}
	@Override
	public List<Member> selectFollowList(String seller, String user_id) {
		// TODO Auto-generated method stub
		return mDao.selectFollowList(seller, user_id);
	}
	@Override
	public List<Member> selectFollowingList(String seller, String user_id) {
		// TODO Auto-generated method stub
		return mDao.selectFollowingList(seller, user_id);
	}
	
	@Override
	public int updatememberReport(Member m) {
		// TODO Auto-generated method stub
		return mDao.updatememberReport(m);
	}

	

	
	

}
