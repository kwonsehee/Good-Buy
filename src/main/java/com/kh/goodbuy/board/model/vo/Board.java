package com.kh.goodbuy.board.model.vo;

import java.sql.Date;

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

public class Board {
	private int bno;
	private String bstatus;
	private String btitle;
	private String bhistory; 
	private Date bmodifydate;
	private Date bcreatedate; 
	private int bcate;
	private String bcatename;
	private String userid;
	private int fno;
	private int postno;
	private String bfile;
    
	} 
	
	

