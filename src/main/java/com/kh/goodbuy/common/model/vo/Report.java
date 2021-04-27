package com.kh.goodbuy.common.model.vo;

import java.sql.Date;

import com.kh.goodbuy.center.model.vo.Notice;

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
public class Report {

	private Integer re_no;
	private String retitle;
	private String re_content;
	private Date create_date;
	private String re_status;
	private String re_result;
	private String report_id;

	private Integer re_cate;
	private String reported_id;
	//private int re_cate;
	private int gno;
	private String change_name;
	private int reported;

}
