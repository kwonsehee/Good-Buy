package com.kh.goodbuy.member.model.vo;

import java.sql.Date;

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
public class MyTown {
	
	private int mytown_type;
	private String user_id;
	private int t_no;
	private int area;
	
	public MyTown(String user_id, int t_no) {
		this.user_id = user_id;
		this.t_no = t_no;
	}
}
