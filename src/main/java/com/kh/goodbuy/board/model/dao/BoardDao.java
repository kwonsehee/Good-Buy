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

	
	// 마이페이지 내가 쓴 글 리스트 카운트 
	public int selectMyBoardListCount(String user_id);
	// 마이페이지 내가 쓴 글 리스트 
	public List<Board> selectMyBoardList(String user_id,PageInfo pi);
	// 게시글 지우기
	public int deleteBoard(int bno); 


	//2 디테일 페이지 
	   public Board BoardDetail(int bno);

	   
	

	}
