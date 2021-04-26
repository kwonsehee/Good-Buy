package com.kh.goodbuy.board.model.service;

import java.util.List;

import com.kh.goodbuy.board.model.vo.Board;
import com.kh.goodbuy.board.model.vo.BoardAddfile;

public interface BoardService {
	public int selectListCount();
	public List<Board> selectList();
	
	public int insertFile(List<BoardAddfile> list);
	
	public int insertBoard(Board b);
}
