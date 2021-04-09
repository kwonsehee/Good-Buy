package com.kh.goodbuy.goods.model.vo;


import java.util.List;

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
public class Gcate {
	private int cno;
	private String topcate;
	private List<Gcate> subcate;
	private String lfilter;
	private String mfilter;
	private String sfilter;
}
