package com.kh.goodbuy.center.model.dao;

import java.util.List;

import com.kh.goodbuy.center.model.vo.QNA;

public interface QnaDao {

	public List<QNA> selectFAQList();

	public QNA selectFAQ(int qa_no);

	public int updateFAQ(QNA q);

	public int deleteFAQ(int qa_no);

}
