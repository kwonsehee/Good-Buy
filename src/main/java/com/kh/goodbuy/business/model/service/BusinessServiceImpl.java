package com.kh.goodbuy.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.goodbuy.business.model.dao.BusinessDao;
import com.kh.goodbuy.business.model.vo.Attachment;
import com.kh.goodbuy.business.model.vo.Business;
import com.kh.goodbuy.business.model.vo.News;

public class BusinessServiceImpl implements BusinessService{
	@Autowired
	private BusinessDao bDao;

	@Override
	public int infoInsert(Business bus) {
		
		return 0;
	}

	@Override
	public List<Business> selectbList() {
		
		return bDao.selectbList();
	}

	@Override
	public List<Attachment> selectfList() {
		// TODO Auto-generated method stub
		return bDao.selectfList();
	}

	@Override
	public List<Attachment> selectnfList() {
		// TODO Auto-generated method stub
		return bDao.selectnfList();
	}

	@Override
	public List<News> selectnList() {
		// TODO Auto-generated method stub
		return bDao.selectnList();
	}

}
