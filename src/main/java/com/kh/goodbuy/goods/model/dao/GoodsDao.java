package com.kh.goodbuy.goods.model.dao;

import java.util.List;

import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.goods.model.vo.Gcate;
import com.kh.goodbuy.goods.model.vo.Goods;

public interface GoodsDao {
	public List<Gcate> selectCate();
	public int insertGoods(Goods g);
	public int selectCateNo(Gcate c);
	public int insertFile(List<Addfile> list);
}
