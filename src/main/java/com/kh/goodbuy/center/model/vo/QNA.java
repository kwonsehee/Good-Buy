package com.kh.goodbuy.center.model.vo;

import java.sql.Date;

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
public class QNA {

		private Integer qa_no;
		private String qa_title;
		private String qa_content;
		private Date qa_date;
		private Date qa_modify;
		private String qa_status;
		private Integer qa_refno;
		private String user_id;
		private String FAQ;
}
