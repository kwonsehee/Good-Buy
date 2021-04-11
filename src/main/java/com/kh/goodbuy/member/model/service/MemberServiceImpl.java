package com.kh.goodbuy.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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
	
	
	

}
