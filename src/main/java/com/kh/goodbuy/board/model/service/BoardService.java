
package com.kh.goodbuy.board.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.goodbuy.board.model.vo.Board;


public interface BoardService {
 


	public List<Board> viewAll();
	/*
	//1.게시글 수 카운트 
	public int selectListCount();
	//2. 페이징 처리된 게시글 목록 조회 
	public List<Board> selectList(PageInfo pi);
	
	// 3.게시글 작성 
	public int insertBoard(Board b);
	//4 게시글 조회 ( 조회수 증가 처리-flag)
	public Board selectBoard(int userid,boolean flag);
    
	//5게시글 수정
	public int updateBoard(Board b);
	
	//6. 게시글 삭제 
	public int deleteBoard(int userid);
	*/

	public static void insertBoard(Board vo) {
		// TODO Auto-generated method stub
		
	}

	
}
