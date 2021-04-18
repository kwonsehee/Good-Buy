package com.kh.goodbuy.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kh.goodbuy.board.model.vo.PageInfo;
import com.kh.goodbuy.board.model.vo.Board;
/*
@Repository
public class BoardDaoImpl implements BoardDao {
 @Autowired
 private SqlSessionTemplate sqlSession;
	
 @Override
 public int selectListCount() {

	 return sqlSession.selectOne("boardMapper.selectListCount");
 }
	@Override
	public List<Board> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReadCount(int userid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}



}
 */