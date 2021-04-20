package com.kh.goodbuy.goods.model.vo;

import java.sql.Date;
import java.util.List;

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
	private String gtitle;
	private String changeName;	//올라간 파일의 변경한 이름
	private List<String> filelist;
	private Town town;
	private Gcate goodcate;
	private int like_cnt;
	private int rep_cnt;
	private String address_3;

	
	public Goods(Integer gno, String user_id) {
		super();
		this.gno = gno;
		this.user_id = user_id;
	}
	
	
	
}
