package com.kh.goodbuy.business.model.service;

import java.util.List;

import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;
import com.kh.goodbuy.business.model.vo.NewsAttachment;

public interface BusinessService {

	int infoInsert(Business bus);

	List<Business> selectbList(String userId);

	List<Attachment> selectfList(String userId);

	List<NewsAttachment> selectnfList(String userId);

	List<News> selectnList(String userId);

	



}
