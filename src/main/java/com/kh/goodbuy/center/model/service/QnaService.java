package com.kh.goodbuy.center.model.service;

import java.util.List;

import com.kh.goodbuy.center.model.vo.QNA;

public interface QnaService {

	public List<QNA> selectQNAList();

	public int insertQNA(QNA q);

	public QNA selectQNA(int qa_no);

	public int updateFAQ(QNA q);

	public int deleteQNA(int qa_no);

}
