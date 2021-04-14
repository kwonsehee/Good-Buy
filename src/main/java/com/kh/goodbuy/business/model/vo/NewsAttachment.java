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
public class NewsAttachment {
	private int nNo;
	private int fNo;
	private String filePath;
	private String originName;
	private String changeName;
	private String status;
}
