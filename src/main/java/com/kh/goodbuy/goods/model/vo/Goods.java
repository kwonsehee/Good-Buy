package com.kh.goodbuy.goods.model.vo;

import java.sql.Date;

import com.kh.goodbuy.member.model.vo.Member;

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
public class Goods {
	private Integer gno;
	private Integer gplace;
	private Integer gprice;
	private String gcondition;
	private String gcomment;
	private Date createDate;
	private Date pullDate;
	private String gstatus;
	private String user_id;
	private Integer cno;
	private String changeName;	//올라간 파일의 변경한 이름
	private String gtitle;
	
}
