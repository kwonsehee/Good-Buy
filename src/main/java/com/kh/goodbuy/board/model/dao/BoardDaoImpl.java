package com.kh.goodbuy.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.board.model.vo.Board;
import com.kh.goodbuy.board.model.vo.BoardAddfile;
import com.kh.goodbuy.member.model.vo.PageInfo;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertBoard(Board b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardmapper.insertboard", b);
	}

	@Override
	public int insertFile(List<BoardAddfile> list) {
		int result = 0;
		for (int i = 0; i < list.size(); i++) {
			result += sqlSession.insert("boardmapper.insertFile", list.get(i));
		}
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardmapper.selectListCount");
	}

	@Override
	public List<Board> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("boardmapper.selectList", null, rowBounds);
		// return sqlSession.selectList("boardmapper.selectList");
	}

//디테일뷰
	@Override
	public Board BoardDetail(int bno) {

		return sqlSession.selectOne("boardmapper.selectdetail", bno);
	}


@Override
public int selectMyBoardListCount(String user_id) {
	return sqlSession.selectOne("boardmapper.selectMyBoardListCount",user_id);
}



@Override
public List<Board> selectMyBoardList(String user_id,PageInfo pi) {
	int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
	RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
	return sqlSession.selectList("boardmapper.selectMyBoardList",user_id,rowBounds);
}



@Override
public int deleteBoard(int bno) {
	return sqlSession.update("boardmapper.deleteBoard",bno);
}




}
