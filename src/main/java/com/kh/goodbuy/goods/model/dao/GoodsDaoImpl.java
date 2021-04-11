package com.kh.goodbuy.goods.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.goods.model.vo.Gcate;
import com.kh.goodbuy.goods.model.vo.Goods;

@Repository
public class GoodsDaoImpl implements GoodsDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Gcate> selectCate() {
		return sqlSession.selectList("goodsMapper.selectCate");
	}

	@Override
	public int insertGoods(Goods g) {
		return  sqlSession.insert("goodsMapper.insertGoods", g);
	}

	@Override
	public int selectCateNo(Gcate c) {
		
		return sqlSession.selectOne("goodsMapper.selectCateNo",c);
	}

	@Override
	public int insertFile(List<Addfile> list) {
		int result = 0;
		for(int i=0;i<list.size();i++) {
			result += sqlSession.insert("goodsMapper.insertFile", list.get(i));
		}
		// TODO Auto-generated method stub
		return result;
	}

}
