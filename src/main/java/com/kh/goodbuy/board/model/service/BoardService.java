package com.kh.goodbuy.board.model.service;

import java.util.List;

import com.kh.goodbuy.board.model.vo.Board;
import com.kh.goodbuy.board.model.vo.BoardAddfile;
import com.kh.goodbuy.member.model.vo.PageInfo;

public interface BoardService {
	public int selectListCount();
	public List<Board> selectList(PageInfo pi);
	
	public int insertFile(List<BoardAddfile> list);
	
	public int insertBoard(Board b);
	
	public Board BoardDetail(int bno);
	
}
