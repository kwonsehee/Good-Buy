package com.kh.goodbuy.board.model.service;

import java.util.List;

import com.kh.goodbuy.board.model.vo.Board;
import com.kh.goodbuy.board.model.vo.BoardAddfile;
import com.kh.goodbuy.business.model.vo.Review;
import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.member.model.vo.PageInfo;

public interface BoardService {
	public int selectListCount();
	public List<Board> selectList(PageInfo pi);
	
	public int insertFile(List<BoardAddfile> list);
	
	public int insertBoard(Board b);
	

	// 마이페이지 내가 쓴 글 리스트 카운트 
	public int selectMyBoardListCount(String user_id);
	
	// 마이페이지 내가 쓴 글 리스트 
	public List<Board> selectMyBoardList(String user_id,PageInfo pi);
	// 게시글 지우기 
	public int deleteBoard(int bno);

	public Board BoardDetail(int bno);

	//추천수
    public int insertlike(int bno,String user_id);
    
    //추천수 삭제 
    public int deletelike(int bno,String user_id);

  
  // 추천수 셀렉 
    public int selectlike(int bno);
    //댓글 insert
	public List<Reply> insertReply(Reply r, Board b);
  //댓글 셀렉
	public List<Reply> selectReplyList(Board b);
	





}
