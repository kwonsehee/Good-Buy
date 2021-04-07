package com.kh.goodbuy.business.model.service;

import java.util.List;


import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;

public interface BusinessService {

	int infoInsert(Business bus);

	List<Business> selectbList();

	List<Attachment> selectfList();

	List<Attachment> selectnfList();

	List<News> selectnList();



}
