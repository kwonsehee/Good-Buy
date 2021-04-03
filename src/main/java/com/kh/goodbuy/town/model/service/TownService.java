package com.kh.goodbuy.town.model.service;

import java.util.List;

import com.kh.goodbuy.member.model.vo.MyTown;
import com.kh.goodbuy.town.model.vo.Town;

public interface TownService {

	// 회원가입시 전체 동네 조회용
	// 시,도
	List<Town> selectAllTown1();
	// 구,군 
	List<Town> selectAllTown2();
	// 읍,면,동
	List<Town> selectAllTown3();

	// 회원가입시 입력한 주소 마이타운 DB 저장용
	int selectTownNo(String address_3);
	
	int insertMyTown(MyTown mt);
	

}
