package com.kh.goodbuy.goods.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.goods.model.vo.Gcate;
import com.kh.goodbuy.goods.model.vo.Goods;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.town.model.vo.Town;

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
	@Override
	public int selectAllCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goodsMapper.selectAllCount");
	}

	@Override
	public int selectListCount(Town m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goodsMapper.selectListCount",m);
	}

	@Override
	public List<Goods> selectAllList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("goodsMapper.selectAllList", null, rowBounds);
	}

	@Override
	public List<Goods> selectList(Town m, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("goodsMapper.selectList",m, rowBounds);
	}

	@Override
	public int selectMyListCount(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goodsMapper.selectMyListCount",user_id);
	}

	@Override
	public List<Goods> selectMyList(String user_id, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("goodsMapper.selectMyList", user_id, rowBounds);
	}

	@Override
	public Town selectSecondTown(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goodsMapper.selectSecondTown",user_id);
	}


}
