package com.jeju.JejuBnB.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.notice.model.vo.Notice;
import com.jeju.JejuBnB.notice.model.vo.User_Notice;

@Repository("noticdDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate session;

	

	public int insertUNotice(User_Notice unotice) {
		return session.insert("noticeMapper.insertUserNotice", unotice);
	}

	public int deleteUNotice(int unoticeno) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteNotice(Notice notice) {
		ArrayList list = new ArrayList();
		String[] noticeNo = notice.getNotice_type_no().split(",");
		for(int i = 0; i < noticeNo.length; i++) {
			list.add(noticeNo[i]);
		}
		int result = session.delete("noticeMapper.deleteNotice", list);
		System.out.println(result);
		System.out.println("확인용 : " + session.delete("noticeMapper.deleteNotice", list));
		return result;
	}

	public ArrayList<User_Notice> selectUserNotice(String userid) {
		List<User_Notice> list = session.selectList("noticeMapper.selectUserNotice", userid);
		return (ArrayList<User_Notice>) list;
	}

	public int deleteUserNotice(int noticeno) {
		return session.delete("noticeMapper.deleteUserNotice", noticeno);
	}

	public Notice selectNotice(int choice) {
		return session.selectOne("noticeMapper.selectNotice", choice);
	}

	public ArrayList<Notice> selectNoticeList() {
		List<Notice> list = session.selectList("noticeMapper.selectNoticeList");
		return (ArrayList<Notice>) list;
	}

	public ArrayList<User_Notice> selectUserNoticeList() {
		List<User_Notice> list = session.selectList("noticeMapper.selectUserNoticeList");
		return (ArrayList<User_Notice>) list;
	}

}
