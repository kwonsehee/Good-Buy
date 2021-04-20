package com.kh.goodbuy.common.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.common.model.vo.Messenger;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.PageInfo;

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

	@Override
	public int selectMsgCount(String user_id) {
		return sqlSession.selectOne("msgMapper.selectMsgCount", user_id);
	}

	@Override
	public List<Messenger> selectMsgList(String user_id, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("msgMapper.selectMsgList", user_id ,rowBounds);
	}

}
