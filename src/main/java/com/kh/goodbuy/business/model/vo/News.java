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
	private int n_no;
	private String newsTitle;
	private String shopNews;
	private int shopNo;
	private int tNo;
	private String address_3;
	private String filePath;
	private String originName;
	private String changeName;
	private String status;
	private int fNo;
	private String nStatus;
	private String photo;
}
