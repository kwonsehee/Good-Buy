package com.kh.goodbuy.board.model.dao;

import java.util.List;

import com.kh.goodbuy.board.model.vo.Board;
import com.kh.goodbuy.board.model.vo.BoardAddfile;
import com.kh.goodbuy.board.model.vo.BoardCate;
import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.goods.model.vo.Gcate;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.PageInfo;

public interface BoardDao {
	
	public int insertBoard(Board b);

	public int insertFile(List<BoardAddfile> list);
	public List<Board> selectList();
	
	//1.게시글 수 카운트 
	   public int selectListCount(); 
	   
	
	}
