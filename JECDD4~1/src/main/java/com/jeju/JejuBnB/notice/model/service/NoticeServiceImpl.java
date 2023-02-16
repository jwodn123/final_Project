package com.jeju.JejuBnB.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.notice.model.dao.NoticeDao;
import com.jeju.JejuBnB.notice.model.vo.Notice;
import com.jeju.JejuBnB.notice.model.vo.User_Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	
	
	@Override
	public int insertUNotice(User_Notice unotice) {
		return noticeDao.insertUNotice(unotice);
	}

	@Override
	public int deleteUNotice(int unoticeno) {
		return noticeDao.deleteUNotice(unoticeno);
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}

	@Override
	public int deleteNotice(Notice notice) {
		return noticeDao.deleteNotice(notice);
	}

	@Override
	public Notice selectNotice(int choice) {
		return noticeDao.selectNotice(choice);
	}

	@Override
	public ArrayList<User_Notice> selectUserNotice(String userid) {
		return noticeDao.selectUserNotice(userid);
	}

	@Override
	public int deleteUserNotice(int noticeno) {
		return noticeDao.deleteUserNotice(noticeno);
	}

	@Override
	public ArrayList<Notice> selectNoticeList() {
		return noticeDao.selectNoticeList();
	}

	@Override
	public ArrayList<User_Notice> selectUserNoticeList() {
		return noticeDao.selectUserNoticeList();
	}

}
