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
public class Payment {
	private int shopNo;
	private int pid;
	private int payment;
	private Date payDate;
	private int payWay;
	
}
