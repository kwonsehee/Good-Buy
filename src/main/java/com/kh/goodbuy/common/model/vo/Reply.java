package com.kh.goodbuy.common.model.vo;

import java.util.Date;

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
public class Reply {
	private int rno;
	private String rcontent;
	private String createDate;
	private String rstatus;
	private int ref_rid;
	private String user_id;
	private String gtitle;
	private String changeName;
	private int gno;

	private String nickname;
}
