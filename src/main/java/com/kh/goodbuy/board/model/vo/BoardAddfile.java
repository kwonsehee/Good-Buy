package com.kh.goodbuy.board.model.vo;

import com.kh.goodbuy.board.model.vo.BoardAddfile;

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
public class BoardAddfile {
	private int fno;
	private String file_path;
	private String originName;
	private String changeName;
	private String status;
	
}
