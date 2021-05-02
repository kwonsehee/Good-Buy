package com.kh.goodbuy.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.board.model.vo.Board;
import com.kh.goodbuy.board.model.vo.BoardAddfile;
import com.kh.goodbuy.business.model.vo.Review;
import com.kh.goodbuy.common.model.vo.Reply;
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

@Override
public int insertlike(int bno, String userid) {
 Map<String,Object> map=new HashMap<>();
 map.put("bno", bno);
 map.put("userid",userid);
 System.out.println("dd"+bno+"dd"+userid);
	return sqlSession.insert("boardmapper.insertlike",map);
}

@Override
public int deletelike(int bno, String userid) {
	Map<String,Object> map=new HashMap<>();
	map.put("bno",bno);
	map.put("userid",userid);

	return sqlSession.delete("boardmapper.countCancel",bno);
}

@Override
public int selectlike(int bno) {

	return sqlSession.selectOne("boardmapper.selectlike");
}

@Override
public int insertPoint(String user_id) {
	
	return sqlSession.update("boardmapper.insertPoint",user_id);
}

@Override
public int insertReply(Reply r, Board b) {
    Map<String,Object>map = new HashMap <String,Object>();
    map.put("r", r);
    map.put("b", b);
    System.out.println("b"+b);
	return sqlSession.insert("boardmapper.insertReply",map);
}

@Override
public List<Reply> selectReplyList(Board b) {

	return sqlSession.selectList("boardmapper.selectReplyList",b.getBno());
}

@Override
public List<Board> selectmainlike() {
	
	return sqlSession.selectList("boardmapper.selectmainlike");
}

@Override
public List<Board> selectlastestlist() {
	return sqlSession.selectList("boardmapper.selectlastestlist");
}



}








