package com.jeju.JejuBnB.notice.model.vo;

import java.sql.Date;

public class User_Notice implements java.io.Serializable{

	private static final long serialVersionUID = 6015L;
	
	private int notice_no;
	private String notice_content;
	private java.sql.Date notice_date;
	private String read_check;
	private String to_user;
	private String from_user;
	
	public User_Notice() {
		
	}

	public User_Notice(int notice_no, String notice_content, Date notice_date, String read_check, String to_user,
			String from_user) {
		super();
		this.notice_no = notice_no;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.read_check = read_check;
		this.to_user = to_user;
		this.from_user = from_user;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public java.sql.Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(java.sql.Date notice_date) {
		this.notice_date = notice_date;
	}

	public String getRead_check() {
		return read_check;
	}

	public void setRead_check(String read_check) {
		this.read_check = read_check;
	}

	public String getTo_user() {
		return to_user;
	}

	public void setTo_user(String to_user) {
		this.to_user = to_user;
	}

	public String getFrom_user() {
		return from_user;
	}

	public void setFrom_user(String from_user) {
		this.from_user = from_user;
	}

	@Override
	public String toString() {
		return "User_Notice [notice_no=" + notice_no + ", notice_content=" + notice_content + ", notice_date="
				+ notice_date + ", read_check=" + read_check + ", to_user=" + to_user + ", from_user=" + from_user
				+ "]";
	}
	
	
}
