package com.kh.goodbuy.business.model.vo;

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
public class News {
	private int nNo;
	private String newsTitle;
	private String shopNews;
	private int shopNo;
}
