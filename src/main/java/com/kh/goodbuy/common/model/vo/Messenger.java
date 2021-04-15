package com.kh.goodbuy.common.model.vo;

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
public class Messenger {
	private int mno;
	private Date createDate;
	private String receiver;
	private String mcontent;
	private int gno;
	private String caller;
}
