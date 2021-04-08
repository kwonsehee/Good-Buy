package com.kh.goodbuy.goods.model.service;

import java.util.List;

import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.goods.model.vo.Gcate;
import com.kh.goodbuy.goods.model.vo.Goods;

public interface GoodsService {
	public List<Gcate> selectCate();
	public int insertGoods(Goods g, List<Addfile> list);
	public int selectCateNo(Gcate c);
	public int insertFile(List<Addfile> list);
}
