package com.kh.goodbuy.goods.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	

}
