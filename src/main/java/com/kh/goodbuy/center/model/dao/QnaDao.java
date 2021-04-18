package com.kh.goodbuy.center.model.dao;

import java.util.List;

import com.kh.goodbuy.center.model.vo.QNA;

public interface QnaDao {

	public List<QNA> selectFAQList();

	public QNA selectFAQ(int qa_no);

	public int updateFAQ(QNA q);

	public int deleteFAQ(int qa_no);

	public int insertQNA(QNA q);

	public List<QNA> selectQNAList();

	public QNA selectQNA(int qa_no);

	public int insertFAQ(QNA q);

	public int updateQNAA(QNA q);

	public List<QNA> selectQNAQList(String user_id);

	public List<QNA> selectQNAList1();

	public List<QNA> selectQNAList2();

	public List<QNA> selectQNAList3();

}
