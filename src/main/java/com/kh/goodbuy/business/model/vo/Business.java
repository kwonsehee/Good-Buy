package com.kh.goodbuy.business.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Business {
//	SHOP_NO	NUMBER
//	SHOP_NAME	VARCHAR2(100 BYTE)
//	SHOP_CATE	VARCHAR2(100 BYTE)
//	SHOP_DETAIL	VARCHAR2(100 BYTE)
//	SHOP_ADD	VARCHAR2(100 BYTE)
//	SHOP_INTRO	VARCHAR2(300 BYTE)
//	SHOP_TIME	VARCHAR2(100 BYTE)
//	TOP_MENU	VARCHAR2(100 BYTE)
//	PRICE	VARCHAR2(100 BYTE)
//	MENU_INFO	VARCHAR2(300 BYTE)
//	SHOP_PHONE	NUMBER
//	USER_ID	VARCHAR2(30 BYTE)
//	AD_CASH	NUMBER
	
	private int shopNo;				// 프로필번호
	private String shopCate;		// 카테고리
	private String shopAdd;			// 주소
	private String shopIntro;		// 소개문구
	private String shopTime1;		// 영업시작시간
	private String topMenu;		 	// 대표메뉴
	private String price;			// 가격
	private String menuInfo;		// 메뉴설명
	private String shopPhone;			// 전화번호
	private String userId;			// 아이디
	private int adCash;				// 광고캐시
	private String shopTime2;		// 영업마감시간
	private String shopTime3;		// 휴무 요일
	private int tNo;				// 동네코드
	private int avgGrade;			// 평균별점
	private int faCount;			// 단골수
	private int reviewCount;		// 후기수
	private String filePath;		
	private String originName;
	private String changeName;
	private String status;
	private int fNo;
	private String shopName;
	private int fileLevel;
	private String month1;
	private int busicash;
}
