package com.kh.goodbuy.goods.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.common.model.vo.Reply;
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

	@Override
	public int selectCateCount(String cate) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goodsMapper.selectCateCount",cate);
	}

	@Override
	public List<Goods> selectCateList(PageInfo pi, String cate) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("goodsMapper.selectCateList", cate, rowBounds);
	}

	@Override
	public int selectCateCount2(Town myTown, String cate) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("myTown",myTown);
		map.put("cate", cate);
		return sqlSession.selectOne("goodsMapper.selectCateCount2",map);
	}

	@Override
	public List<Goods> selectCateList2(Town myTown, PageInfo pi, String cate) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("myTown",myTown);
		map.put("cate", cate);
		return sqlSession.selectList("goodsMapper.selectCateList2",map, rowBounds);
	}

	@Override
	public int selectMyCateListCount(String user_id, String cate) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("cate", cate);
		return sqlSession.selectOne("goodsMapper.selectMyCateListCount",map);
	}

	@Override
	public List<Goods> selectMyCateList(String user_id, PageInfo pi, String cate) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("cate", cate);
		return sqlSession.selectList("goodsMapper.selectMyCateList",map, rowBounds);
	}

	@Override
	public Goods Goodsdetail(int gno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goodsMapper.Goodsdetail",gno);
	}

	@Override
	public Goods GoodsMydetail(int gno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("goodsMapper.GoodsMydetail",gno);
	}

	@Override
	public int likeGoods(int gno, String user_id) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("gno", gno);
		return sqlSession.selectOne("goodsMapper.likeGoods", map);
	}

	@Override
	public int deleteLike(int gno, String user_id) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("gno", gno);
		return sqlSession.delete("goodsMapper.deleteLike", map);
	}

	@Override
	public int insertLike(int gno, String user_id) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("gno", gno);
		return sqlSession.insert("goodsMapper.insertLike", map);
	}

	@Override

	public int insertReply(Reply r, Goods g) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("r",r);
		map.put("g", g);
		return sqlSession.insert("goodsMapper.insertReply", map);
	}

	@Override
	public List<Reply> selectReplyList(Goods g) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("goodsMapper.selectReplyList", g.getGno());
  }
  
	@Override
	public List<Goods> selectMySellingList(String user_id, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("goodsMapper.selectMySellingList", user_id, rowBounds);

	}

	@Override
	public int changeGoodsStatus(Goods g,String status) {
		System.out.println("지금 상품 상태 뭐니~ " + status);
		if(status.equals("selling"))
			return sqlSession.update("goodsMapper.changeGoodsStatus",g);
		else
			return sqlSession.update("goodsMapper.changeGoodsStatus2",g);
	}

	@Override
	public int selectMyHiddenListCount(String user_id) {
		return sqlSession.selectOne("goodsMapper.selectMyHiddenListCount",user_id);
	}

	@Override
	public List<Goods> selectMyHiddenList(String user_id, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("goodsMapper.selectMyHiddenList", user_id, rowBounds);
	}

	@Override

	public int selectMyLikeGoodsCount(String user_id) {
		return sqlSession.selectOne("goodsMapper.selectMyLikeGoodsCount", user_id);
	}

	@Override
	public List<Goods> selectMyLikeGoodsList(String user_id, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("goodsMapper.selectMyLikeGoodsList", user_id, rowBounds);
	}
	public int deleteGoods(int gno) {
		// TODO Auto-generated method stub
		return sqlSession.update("goodsMapper.deleteGoods", gno);
	}

	@Override
	public int hideGoods(int gno) {
		// TODO Auto-generated method stub
		return sqlSession.update("goodsMapper.hideGoods", gno);
	}

	@Override
	public int payUpPoint(Integer gno) {
		// TODO Auto-generated method stub
		return sqlSession.update("goodsMapper.payUpPoint", gno);
	}

	@Override
	public int upGoods(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.update("goodsMapper.upGoods", user_id);

	}
}
