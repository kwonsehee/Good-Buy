package com.kh.goodbuy.goods.model.service;

import java.util.List;

import com.kh.goodbuy.common.model.vo.Keyword;
import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.goods.model.vo.Gcate;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.member.model.vo.Search;
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
	//상품 디테일뷰
	public Goods Goodsdetail(int gno);
	//상품 디테일뷰 판매자
	public Goods GoodsMydetail(int gno);
	//찜여부
	public int likeGoods(int gno, String user_id);
	//찜 삭제
	public int deleteLike(int gno, String user_id);
	//찜 하기
	public int insertLike(int gno, String user_id);

	//댓글 insert
	public List<Reply> insertReply(Reply r, Goods g);
	//댓글 select
	public List<Reply> selectReplyList(Goods g);
	//마이페이지 판매내역조회
	public List<Goods> selectMySellingList(String user_id, PageInfo pi);
	// 유저의 중고상품 판매중 -> 숨김처리 / 숨김 -> 판매중
	public int changeGoodsStatus(Goods g, String status);
	//마이페이지 판매내역조회 숨김 리스트 카운트
	public int selectMyHiddenListCount(String user_id);
	// 숨김리스트 조회
	public List<Goods> selectMyHiddenList(String user_id, PageInfo pi);
	// 내가 찜한 중고상품 리스트 카운트
	public int selectMyLikeGoodsCount(String user_id);
	// 내가 찜한 중고상품 리스트 조회 
	public List<Goods> selectMyLikeGoodsList(String user_id, PageInfo pi);
	//상품 삭제 
	public int deleteGoods(int gno);
	//상품숨김
	public int hideGoods(int gno);
	//끌올 포인트 결제
	public int payUpPoint(Integer gno, String string);

	
	// 관리자
	public List<Goods> selectGoodsList(PageInfo pi);

	//좋아요한사람
	public List<String> selectLikeGoods(int gno);
	//상품수정
	public int updateGoods(Goods g, List<Addfile> list);
	// 안전거래내역 리스트 카운트
	public int selectMyDealListCount(String user_id);
	// 안전거래내역 리스트 출력
	public List<Goods> selectMyDealList(String user_id, PageInfo pi);

	
	// 관리자
	public Goods selectProduct(int gno);
	public List<Goods> searchList(Search search);

	//댓글삭제
	public List<Reply> updateReply(int rno, Goods g);
	
	// 키워드 대조
	public List<Keyword> searchKeyword(String[] gArr);

	// 관리자 상품 관리
	public int updateProduct(int gno);
	public int updateProduct2(int gno);

	//파일삭제
	public int deleteFile(String index);
	//user 없을때 검색 카운트
	public int selectSearchCount(String search);
	//user 없을떄 검색 리스트 셀렉
	public List<Goods> selectSearchList(PageInfo pi, String search);
	//user 있을떄 검색 카운트
	public int selectMySearchCount(String search, Town myTown);
	//user 있을떄 검색 리스트 셀렉
	public List<Goods> selectMySearchList(PageInfo pi, String search, Town myTown);
	//판매자가 파는 상품리스트 셀렉
	public List<Goods> selectSellingList(String user_id);






}
