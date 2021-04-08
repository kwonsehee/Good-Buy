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

	@Override
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return nDao.insertNotice(n);
	}

	@Override
	public Notice selectNotice(int nt_no) {
		// TODO Auto-generated method stub
		return nDao.selectNotice(nt_no);
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return nDao.updateNotice(n);
	}

	@Override
	public int deleteNotice(int nt_no) {
		// TODO Auto-generated method stub
		return nDao.deleteNotice(nt_no);
	}
}
