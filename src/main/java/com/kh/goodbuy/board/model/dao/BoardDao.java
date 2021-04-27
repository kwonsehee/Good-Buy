package com.kh.goodbuy.board.model.dao;

import java.util.List;

import com.kh.goodbuy.board.model.vo.Board;
import com.kh.goodbuy.board.model.vo.BoardAddfile;
import com.kh.goodbuy.member.model.vo.PageInfo;

public interface BoardDao {
	
	public int insertBoard(Board b);

	public int insertFile(List<BoardAddfile> list);
	
	public List<Board> selectList(PageInfo pi);
	
	//1.게시글 수 카운트 
	   public int selectListCount();

	//2 디테일 페이지 
	   public Board BoardDetail(int bno);
	   
	

	}
