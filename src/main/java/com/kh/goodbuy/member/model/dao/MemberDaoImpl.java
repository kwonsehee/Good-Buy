package com.kh.goodbuy.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.MyTown;

@Repository
public class MemberDaoImpl implements MemberDao {

	// root-context.xml에서 작성한 빈으로 생성되어 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.selectMember", m);
	}

	@Override
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	@Override
	public int insertMember(MyTown mt) {
		return sqlSession.insert("memberMapper.insertMember", mt);
	}

	@Override
	public int insertMember(ArrayList<Object> list) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMember", list);
	}

}
