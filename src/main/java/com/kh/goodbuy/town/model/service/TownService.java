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

	// 회원가입시 입력한 주소 마이타운 DB 저장용1(t_no조회)
	int selectTownNo(String address_3);
	
	// 회원가입시 입력한 주소 마이타운 DB 저장용2
	int insertMyTown(MyTown mt);
	
	// 내동네 두번째 동네 DB 저장용
	int insertMyNewTown(MyTown mt);
	
	// 내동네 1,2 리스트 조회
	List<String> selectMyTownList(String user_id);
	
	// 내동네 한 개 삭제
	int deleteTown(MyTown mt);
	
	// 로그인 유저의 동네 정보 조회용 
	Town selectUserTown(String user_id);
	
	// 내동네 한개 삭제 시 남은 내동네가 기본 동네로 업데이트 
	int changeTownType(String user_id);
	
	// 내동네 기본동네 타입 변경용
	int changeTownType2(String user_id);
	
	// 내동네 범위 변경용
	int changeArea(MyTown mt);
	
	// 회원정보 수정시 마이타운 수정
	int updateMyTown(MyTown mt);
	
	List<Town> selectSeoul();
	
}
