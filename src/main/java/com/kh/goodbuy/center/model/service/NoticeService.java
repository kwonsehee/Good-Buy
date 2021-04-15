package com.kh.goodbuy.center.model.service;

import java.util.List;

import com.kh.goodbuy.center.model.vo.Notice;

public interface NoticeService {

	public List<Notice> selectNoticeList();

	public int insertNotice(Notice n);

	public Notice selectNotice(int nt_no);

	public int updateNotice(Notice n);

	public int deleteNotice(int nt_no);

	

	

	

}
