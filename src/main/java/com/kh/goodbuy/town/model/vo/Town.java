package com.kh.goodbuy.town.model.vo;

import java.sql.Date;

import com.kh.goodbuy.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class Town {
	private int t_no;
	private int area;
	private String address_1;
	private String address_2;
	private String address_3;       
	      
	
	
	
}
