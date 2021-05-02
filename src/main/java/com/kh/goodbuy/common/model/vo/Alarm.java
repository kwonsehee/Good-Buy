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
public class Alarm {
	private int alarm_no;
	private int alarm_type;
	private String alarm_content;
	private String user_id;
	private Date alarm_date;
	private int ref_no;
	private String a_status;
	private String goods_thum;
	
}
