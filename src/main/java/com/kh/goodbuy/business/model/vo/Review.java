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
public class Review {
	private int shopNo;
	private int reviewNo;
	private String status;
	private String content;
	private Date reviewDate;
	private int grade;
	private String userId;
	private String nickName;
	
}
