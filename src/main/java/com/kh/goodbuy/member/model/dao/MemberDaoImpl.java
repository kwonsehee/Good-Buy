package com.kh.goodbuy.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	//root-context.xml에서 작성한 빈으로 생성되어 주입
	@Autowired
	private SqlSessionTemplate sqlSession;
		
	@Override
	public Member selectMember(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectMember", m);
	}

	@Override
	public int insertMember(Member m) {
		
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

}
