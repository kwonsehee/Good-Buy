package com.kh.goodbuy.member.model.vo;



import java.util.Date;

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
public class Search {
	private String searchCondition;
	private String searchValue;
	private String existFile;
	private String date1;
	private String date2;
}
