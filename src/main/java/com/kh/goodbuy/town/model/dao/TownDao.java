package com.kh.goodbuy.town.model.dao;

import java.util.List;

import com.kh.goodbuy.member.model.vo.MyTown;
import com.kh.goodbuy.town.model.vo.Town;

public interface TownDao {

	List<Town> selectAllTown1();
	
	List<Town> selectAllTown2();
	
	List<Town> selectAllTown3();

	int selectTownNo(String address_3);

	int insertMyTown(MyTown mt);
	
	int insertMyNewTown(MyTown mt);

	List<String> selectMyTownList(String user_id);

	int deleteTown(MyTown mt);

	Town selectUserTown(String user_id);

	int changeTownType(String user_id);

	int changeTownType2(String user_id);

	int changeArea(MyTown mt);

	int updateMyTown(MyTown mt);

}
