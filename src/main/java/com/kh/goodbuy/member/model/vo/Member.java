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
public class Member {
	private String user_id;
	private String nickname;
	private String user_pwd;
	private String email;
	private String phone;
	private String photo;
	private Integer point;
	private Integer reported;
	private Integer user_type;
	private String ustatus;
	private Date enroll_date;
	private String admin_memo;
	private String  is_business;
}
