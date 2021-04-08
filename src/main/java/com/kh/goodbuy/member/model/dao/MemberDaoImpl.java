package com.kh.goodbuy.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.MyTown;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.member.model.vo.Search;


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

	@Override
	public List<Member> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("memberMapper.selectList", null, rowBounds);
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectListCount");
	}

	@Override
	public List<Member> searchList(Search search) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberMapper.searchList", search);
	}

	

	

}
