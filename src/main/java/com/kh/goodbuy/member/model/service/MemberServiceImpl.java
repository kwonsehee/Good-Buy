package com.kh.goodbuy.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodbuy.member.model.dao.MemberDao;
import com.kh.goodbuy.member.model.vo.Member;

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

}
