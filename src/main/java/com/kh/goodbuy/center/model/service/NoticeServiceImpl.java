package com.kh.goodbuy.center.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodbuy.center.model.dao.NoticeDao;
import com.kh.goodbuy.center.model.vo.Notice;
import com.kh.goodbuy.town.model.dao.TownDao;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao nDao;

	@Override
	public List<Notice> selectNoticeList() {
		// TODO Auto-generated method stub
		return nDao.selectNoticeList();
	}
}
