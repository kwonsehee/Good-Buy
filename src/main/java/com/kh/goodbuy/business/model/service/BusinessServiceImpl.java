package com.kh.goodbuy.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodbuy.business.model.dao.BusinessDao;
import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;
import com.kh.goodbuy.business.model.vo.NewsAttachment;

@Service
public class BusinessServiceImpl implements BusinessService{
	@Autowired
	private BusinessDao bDao;

	@Override
	public int infoInsert(Business bus) {
		
		return 0;
	}

	@Override
	public List<Business> selectbList(String userId) {
		
		return bDao.selectbList(userId);
	}

	@Override
	public List<Attachment> selectfList(String userId) {
		// TODO Auto-generated method stub
		return bDao.selectfList(userId);
	}

	@Override
	public List<NewsAttachment> selectnfList(String userId) {
		// TODO Auto-generated method stub
		return bDao.selectnfList(userId);
	}

	@Override
	public List<News> selectnList(String userId) {
		// TODO Auto-generated method stub
		return bDao.selectnList(userId);
	}

}
