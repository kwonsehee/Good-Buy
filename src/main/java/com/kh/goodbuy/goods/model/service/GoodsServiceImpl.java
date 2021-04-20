package com.kh.goodbuy.goods.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.goods.model.dao.GoodsDao;
import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.goods.model.vo.Gcate;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.town.model.vo.Town;
@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsDao gDao;
	@Override
	public List<Gcate> selectCate() {
		
		return gDao.selectCate();
	}
	@Override
	public int insertGoods(Goods g, List<Addfile> list) {
		int result = gDao.insertGoods(g);
		if(result>0) return gDao.insertFile(list);
		else return 0;
	}
	
	@Override
	public int selectCateNo(Gcate c) {
		// TODO Auto-generated method stub
		return gDao.selectCateNo(c);
	}
	@Override
	public int insertFile(List<Addfile> list) {
		// TODO Auto-generated method stub
		return gDao.insertFile(list);
	}
	@Override
	public int selectAllCount() {
		// TODO Auto-generated method stub
		return gDao.selectAllCount();
	}
	@Override
	public int selectListCount(Town m) {
		// TODO Auto-generated method stub
		return gDao.selectListCount(m);
	}
	@Override
	public List<Goods> selectAllList(PageInfo pi) {
		// TODO Auto-generated method stub
		return gDao.selectAllList(pi);
	}
	@Override
	public List<Goods> selectList(Town m, PageInfo pi) {
		// TODO Auto-generated method stub
		return gDao.selectList(m, pi);
	}
	@Override
	public int selectMyListCount(String user_id) {
		// TODO Auto-generated method stub
		return gDao.selectMyListCount(user_id);
	}
	@Override
	public List<Goods> selectMyList(String user_id, PageInfo pi) {
		// TODO Auto-generated method stub
		return gDao.selectMyList(user_id, pi);
	}
	@Override
	public Town selectSecondTown(String user_id) {
		// TODO Auto-generated method stub
		return gDao.selectSecondTown(user_id);
	}
	@Override
	public int selectCateCount(String cate) {
		// TODO Auto-generated method stub
		return gDao.selectCateCount(cate);
	}
	@Override
	public List<Goods> selectCateList(PageInfo pi, String cate) {
		// TODO Auto-generated method stub
		return gDao.selectCateList(pi, cate);
	}
	@Override
	public int selectCateCount2(Town myTown, String cate) {
		// TODO Auto-generated method stub
		return gDao.selectCateCount2(myTown, cate);
	}
	@Override
	public List<Goods> selectCateList2(Town myTown, PageInfo pi, String cate) {
		// TODO Auto-generated method stub
		return gDao.selectCateList2(myTown, pi, cate);
	}
	@Override
	public int selectMyCateListCount(String user_id, String cate) {
		// TODO Auto-generated method stub
		return gDao.selectMyCateListCount(user_id, cate);
	}
	@Override
	public List<Goods> selectMyCateList(String user_id, PageInfo pi, String cate) {
		// TODO Auto-generated method stub
		return gDao.selectMyCateList(user_id, pi, cate);
	}
	@Override
	public Goods Goodsdetail(int gno) {
		// TODO Auto-generated method stub
		return gDao.Goodsdetail(gno);
	}
	@Override
	public Goods GoodsMydetail(int gno) {
		// TODO Auto-generated method stub
		return gDao.GoodsMydetail(gno);
	}
	@Override
	public int likeGoods(int gno, String user_id) {
		// TODO Auto-generated method stub
		return gDao.likeGoods(gno, user_id);
	}
	@Override
	public int deleteLike(int gno, String user_id) {
		// TODO Auto-generated method stub
		return gDao.deleteLike(gno, user_id);
	}
	@Override
	public int insertLike(int gno, String user_id) {
		// TODO Auto-generated method stub
		return gDao.insertLike(gno, user_id);
	}
	@Override
	public List<Reply> insertReply(Reply r, Goods g) {
		gDao.insertReply(r, g);
		return gDao.selectReplyList(g);
	}
	@Override
	public List<Reply> selectReplyList(Goods g) {
		// TODO Auto-generated method stub
		return gDao.selectReplyList(g);
  }
  @Override
	public List<Goods> selectMySellingList(String user_id, PageInfo pi) {
		return gDao.selectMySellingList(user_id, pi);

	}
	@Override
	public int changeGoodsStatus(Goods g, String status) {
		return gDao.changeGoodsStatus(g, status);
	}
	@Override
	public int selectMyHiddenListCount(String user_id) {
		return gDao.selectMyHiddenListCount(user_id);
	}
	@Override
	public List<Goods> selectMyHiddenList(String user_id, PageInfo pi) {
		return gDao.selectMyHiddenList(user_id, pi);
	}
	@Override

	public int selectMyLikeGoodsCount(String user_id) {
		return gDao.selectMyLikeGoodsCount(user_id);
	}
	@Override
	public List<Goods> selectMyLikeGoodsList(String user_id, PageInfo pi) {
		return gDao.selectMyLikeGoodsList(user_id,pi);
	}
	public int deleteGoods(int gno) {
		// TODO Auto-generated method stub
		return gDao.deleteGoods(gno);
	}
	@Override
	public int hideGoods(int gno) {
		// TODO Auto-generated method stub
		return gDao.hideGoods(gno);
	}
	
	@Override
	public int payUpPoint(Integer gno, String user_id) {
		int result = gDao.upGoods(user_id);
		return gDao.payUpPoint(gno);

	}
	@Override
	public List<Goods> selectGoodsList(PageInfo pi) {
		// TODO Auto-generated method stub
		return gDao.selectGoodsList(pi);
  }
  
	@Override
	public List<String> selectLikeGoods(int gno) {
		// TODO Auto-generated method stub
		return gDao.selectLikeGoods(gno);
	}
	@Override
	public int updateGoods(Goods g, List<Addfile> list) {
		// TODO Auto-generated method stub
		return gDao.updateGoods(g);
	}
	@Override
	public int selectMyDealListCount(String user_id) {
		return gDao.selectMyDealListCount(user_id);
	}
	@Override
	public List<Goods> selectMyDealList(String user_id, PageInfo pi) {
		return gDao.selectMyDealList(user_id, pi);

	}
	

}
