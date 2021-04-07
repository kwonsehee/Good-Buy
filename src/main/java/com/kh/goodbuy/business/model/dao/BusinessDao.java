package com.kh.goodbuy.business.model.dao;

import java.util.List;

import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;

public interface BusinessDao {

	List<Business> selectbList();

	List<Attachment> selectfList();

	List<Attachment> selectnfList();

	List<News> selectnList();

}
