package com.kh.goodbuy.center.model.vo;

import java.sql.Date;

import com.kh.goodbuy.town.model.vo.Town;

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
public class Notice {

	private Integer nt_no;
	private String nt_title;
	private String nt_content;
	private String user_id;
	private String nt_status;
	private Date nt_create_date;
	private Date nt_modify_date;
	private Integer nt_cnt;
}
