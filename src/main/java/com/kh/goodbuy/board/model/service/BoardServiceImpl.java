package com.kh.goodbuy.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.goodbuy.board.model.dao.BoardDao;
import com.kh.goodbuy.board.model.vo.PageInfo;
import com.kh.goodbuy.board.model.vo.Board;

@Service
public abstract class BoardServiceImpl implements BoardService {
	
	
	@PostMapping("write")
	public String write(Board vo) {
		BoardService.insertBoard(vo);
		return "redirect: /detail?seq="+ vo.getSeq();
	}
	/*
	@Autowired 
	private BoardDao bDao;

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return bDao.selectListCount();
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
	public Board selectBoard(int userid, boolean flag) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int userid) {
		// TODO Auto-generated method stub
		return 0;
	}
*/

}
