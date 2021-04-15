package com.kh.goodbuy.common.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.goods.model.vo.Goods;

@Repository
public class MessengerDaoImpl implements MessengerDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMsg(String mcontent, Goods g, String caller) {
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("mcontent", mcontent);
		map.put("g", g);
		map.put("caller", caller);
		System.out.println("dao"+mcontent);
		return sqlSession.insert("msgMapper.insertMsg",map);
	}

}
