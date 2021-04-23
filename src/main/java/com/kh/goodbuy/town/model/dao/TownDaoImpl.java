package com.kh.goodbuy.town.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goodbuy.member.model.vo.MyTown;
import com.kh.goodbuy.town.model.vo.Town;

@Repository	
public class TownDaoImpl implements TownDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Town> selectAllTown1() {
		return sqlSession.selectList("townMapper.selectAllTown1");
	}


	@Override
	public List<Town> selectAllTown2() {
		return sqlSession.selectList("townMapper.selectAllTown2");
	}


	@Override
	public List<Town> selectAllTown3() {
		return sqlSession.selectList("townMapper.selectAllTown3");
	}


	@Override
	public int selectTownNo(String address_3) {
		System.out.println("DaoImpl : "+address_3);
		return sqlSession.selectOne("townMapper.selectTownNo", address_3);
	}


	@Override
	public int insertMyTown(MyTown mt) {
		return sqlSession.insert("townMapper.insertMyTown",mt);
	}


	@Override
	public int insertMyNewTown(MyTown mt) {
		return sqlSession.insert("townMapper.insertMyNewTown",mt);
	}


	@Override
	public List<String> selectMyTownList(String user_id) {
		return sqlSession.selectList("townMapper.selectMyTownList",user_id);
	}


	@Override
	public int deleteTown(MyTown mt) {
		return sqlSession.delete("townMapper.deleteTown", mt);
	}


	@Override
	public Town selectUserTown(String user_id) {
		return sqlSession.selectOne("townMapper.selectUserTown", user_id);
	}


	@Override
	public int changeTownType(String user_id) {
		return sqlSession.update("townMapper.changeTownType",user_id);
	}


	@Override
	public int changeTownType2(String user_id) {
		return sqlSession.update("townMapper.changeTownType2",user_id);
	}


	@Override
	public int changeArea(MyTown mt) {
		return sqlSession.update("townMapper.changeArea",mt);
	}


	@Override
	public int updateMyTown(MyTown mt) {
		return sqlSession.update("townMapper.updateMyTown",mt);
	}





}
