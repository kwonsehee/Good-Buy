package com.kh.goodbuy.center.model.dao;

import java.util.List;

import com.kh.goodbuy.center.model.vo.Notice;

public interface NoticeDao {

	public List<Notice> selectNoticeList();

	public int insertNotice(Notice n);

	public Notice selectNotice(int nt_no);

	public int updateNotice(Notice n);

	public int deleteNotice(int nt_no);

}
