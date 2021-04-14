package com.kh.goodbuy.goods.model.service;

import java.util.List;

import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.goods.model.vo.Gcate;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.town.model.vo.Town;

public interface GoodsService {
	public List<Gcate> selectCate();
	public int insertGoods(Goods g, List<Addfile> list);
	public int selectCateNo(Gcate c);
	public int insertFile(List<Addfile> list);
	//로그인 안햇을때 리스트 카운트
	public int selectAllCount();
	//로그인 했을때 리스트 카운트 
	public int selectListCount(Town m);
	//로그인 안됐을때 전체리스트 가져오기
	public List<Goods> selectAllList(PageInfo pi);
	//로그인 했을 때, 내동네의 상품 리스트 가져오기
	public List<Goods> selectList(Town m, PageInfo pi);
	//내 상품 리스트 카운트
	public int selectMyListCount(String user_id);
	//내상품 리스트 셀렉 
	public List<Goods> selectMyList(String user_id, PageInfo pi);
	//insert할때 내 세컨드 동네가져오기
	public Town selectSecondTown(String user_id);
	//로그인 안했을때 카테고리 리스트 카운트 
	public int selectCateCount(String cate);
	//로그인 안했을때 카테고리 리스트 가져오기
	public List<Goods> selectCateList(PageInfo pi, String cate);
	//로그인 했을때 카테고리 카운트
	public int selectCateCount2(Town myTown, String cate);
	//로그인 했을때 카테고리 리스트 가져오기
	public List<Goods> selectCateList2(Town myTown, PageInfo pi, String cate);
	//내 상품 리스트 cate 카운트
	public int selectMyCateListCount(String user_id, String cate);
	//내상품 cate 리스트 셀렉 
	public List<Goods> selectMyCateList(String user_id, PageInfo pi, String cate);
}
