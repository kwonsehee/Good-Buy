package com.kh.goodbuy.goods.model.vo;



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
public class Addfile {
	private int fno;
	private String file_path;
	private String originName;
	private String changeName;
	private String status;
	private int file_level;	//썸네일용
}
