package com.kh.goodbuy.goods.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodbuy.goods.model.dao.GoodsDao;
import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.goods.model.vo.Gcate;
import com.kh.goodbuy.goods.model.vo.Goods;
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

}
