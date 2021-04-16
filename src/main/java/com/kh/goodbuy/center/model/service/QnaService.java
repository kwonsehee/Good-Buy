package com.kh.goodbuy.center.model.service;

import java.util.List;

import com.kh.goodbuy.center.model.vo.QNA;

public interface QnaService {

	public List<QNA> selectFAQList();

	public QNA selectFAQ(int qa_no);

	public int updateFAQ(QNA q);

	public int deleteFAQ(int qa_no);

	public int insertQNA(QNA q);

	public List<QNA> selectQNAList();

	public QNA selectQNA(int qa_no);

	public int insertFAQ(QNA q);

}
