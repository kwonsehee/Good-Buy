package com.kh.goodbuy.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.common.model.vo.Keyword;
import com.kh.goodbuy.common.model.vo.Reply;
import com.kh.goodbuy.common.model.vo.Report;
import com.kh.goodbuy.goods.model.vo.Addfile;
import com.kh.goodbuy.member.model.vo.Member;
import com.kh.goodbuy.member.model.vo.MyTown;
import com.kh.goodbuy.member.model.vo.PageInfo;
import com.kh.goodbuy.member.model.vo.Search;


@Repository
public class MemberDaoImpl implements MemberDao {

	// root-context.xml에서 작성한 빈으로 생성되어 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.selectMember", m);
	}

	@Override
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	@Override
	public int insertMember(MyTown mt) {
		return sqlSession.insert("memberMapper.insertMember", mt);
	}

	@Override
	public int insertMember(ArrayList<Object> list) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMember", list);
	}

	@Override
	public List<Member> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("memberMapper.selectList", null, rowBounds);
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectListCount");
	}

	@Override
	public List<Member> searchList(Search search) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberMapper.searchList", search);
	}

	@Override
	public Member selectMemberDetail(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectMemberDetail", user_id);
	}

	@Override
	public int userIdCheck(String user_id) {
		return sqlSession.selectOne("memberMapper.userIdCheck", user_id);
	}

	@Override
	public int updateMember(Member loginUser) {
		return sqlSession.update("memberMapper.updateMember",loginUser);
	}


	@Override
	public int updateUserPhoto(Member loginUser) {
		return sqlSession.update("memberMapper.updateUserPhoto",loginUser);
	}

	@Override
	public int deleteUserPhoto(Member loginUser) {
		return sqlSession.update("memberMapper.deleteUserPhoto",loginUser);
	}
	
	


	@Override
	public int updateadminMember(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateadminMember",m);
	}

	@Override
	public int updatePoint(String user_id, int user_point) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("user_point", user_point);
		return sqlSession.update("memberMapper.updatePoint",map);
	}

	@Override
	public int insertDeal(String user_id, int amount, int gno) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("amount", amount);
		map.put("gno", gno);
		return sqlSession.update("memberMapper.insertDeal",map);
	}

	@Override
	public int insertDealPoint(String user_id, int amount, int gno) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("amount", amount);
		map.put("gno", gno);
		return sqlSession.update("memberMapper.insertDealPoint",map);
	}

	@Override
	public String selectSellerPhoto(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectSellerPhoto", user_id);
	}

	@Override
	public int deleteMember(String user_id) {
		return sqlSession.update("memberMapper.deleteMember",user_id);
	}

	@Override
	public int insertKeyword(Keyword k) {
		return sqlSession.insert("memberMapper.insertKeyword", k);
	}

	@Override
	public List<Keyword> selectKeyword(String user_id) {
		return sqlSession.selectList("memberMapper.selectKeyword",user_id);
	}

	@Override
	public List<Reply> selectReplyList(String user_id, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("memberMapper.selectReplyList",user_id,rowBounds);
	}

	@Override
	public int selectReplyCount(String user_id) {
		return sqlSession.selectOne("memberMapper.selectReplyCount",user_id);
	}

	@Override
	public int deleteReply(Reply r) {
		return sqlSession.update("memberMapper.deleteReply", r);
	}

	@Override

	public int updatememberReport(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updatememberReport",m);
	}
	public int insertFollow(String user_id, String seller) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("seller", seller);
		return sqlSession.insert("memberMapper.insertFollow", map);
	}

	@Override
	public int isFollow(String seller, String user_id) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("seller", seller);
		return sqlSession.selectOne("memberMapper.isFollow", map);
	}

	@Override
	public int canselFollow(String user_id, String seller) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("seller", seller);
		return sqlSession.delete("memberMapper.canselFollow", map);

	}


	@Override
	public List<Member> selectFollowList(String seller, String user_id) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("seller", seller);
		System.out.println("멤버디에오 :"+user_id+"seller : "+seller);
		return sqlSession.selectList("memberMapper.selectFollowList", map);
	}

	@Override
	public List<Member> selectFollowingList(String seller, String user_id) {
		Map<String, Object> map = new HashMap <String, Object>();
		map.put("user_id",user_id);
		map.put("seller", seller);
		System.out.println("멤버디에오 :"+user_id+"seller : "+seller);
		return sqlSession.selectList("memberMapper.selectFollowingList", map);
	}

	@Override
	public List<Member> selectMyFollowingList(String user_id) {
		return sqlSession.selectList("memberMapper.selectMyFollowingList", user_id);
	}

	@Override
	public int selectMyFollowingCount(String user_id) {
		return sqlSession.selectOne("memberMapper.selectMyFollowingCount", user_id);
	}

	@Override
	public List<Member> selectMyFollowerList(String user_id) {
		return sqlSession.selectList("memberMapper.selectMyFollowerList",user_id);
	}

	@Override
	public int selectMyFollowerCount(String user_id) {
		return sqlSession.selectOne("memberMapper.selectMyFollowerCount",user_id);
	}

	@Override
	public int deleteKey(Keyword k) {
		return sqlSession.delete("memberMapper.deleteKey", k);
	}

	@Override
	public String findUserId(String email) {
		return sqlSession.selectOne("memberMapper.findUserId",email);
	}



	

}
