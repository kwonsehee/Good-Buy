package com.kh.goodbuy.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodbuy.board.model.dao.BoardDao;
import com.kh.goodbuy.board.model.vo.Board;
import com.kh.goodbuy.board.model.vo.BoardAddfile;
import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.member.model.vo.PageInfo;


@Service
public class boardserivceimpl implements BoardService {
	@Autowired
	private BoardDao bDao;
	
	@Override
	public int insertBoard(Board b) {
		
 return bDao.insertBoard(b);
	}



	@Override
	public int insertFile(List<BoardAddfile> list) {
		
		return bDao.insertFile(list);
	}



	@Override
	public List<Board> selectList(PageInfo pi) {
	
		return bDao.selectList(pi);
	}



	@Override
	public int selectListCount() {
	
		return bDao.selectListCount();
		}




	@Override
	public int selectMyBoardListCount(String user_id) {
		return bDao.selectMyBoardListCount(user_id);
	}

	
	//디테일페이지
	@Override
	public Board BoardDetail(int bno) {
		
		return  bDao.BoardDetail(bno);

	}




	@Override
	public List<Board> selectMyBoardList(String user_id,PageInfo pi) {
		return bDao.selectMyBoardList(user_id,pi);
	}



	@Override
	public int deleteBoard(int bno) {
		return bDao.deleteBoard(bno);
	}
	@Override
	public int insertlike(int bno, String userid) {

		return bDao.insertlike(bno,userid);
	}



	@Override
	public int deletelike(int bno, String userid) {
		
		return bDao.deletelike(bno,userid);
	}



	@Override
	public int selectlike(int bno) {
		
		return bDao.selectlike(bno);
	}



	@Override
	public List<Reply> insertReply(Reply r, Board b) {
		int result =bDao.insertReply(r,b);
		if(result >0) {
			bDao.insertPoint(r.getUser_id());
		}
		return bDao.selectReplyList(b);
	}



	@Override
	public List<Reply> selectReplyList(Board b) {
		return bDao.selectReplyList(b);
	}















	}

	

	
	

