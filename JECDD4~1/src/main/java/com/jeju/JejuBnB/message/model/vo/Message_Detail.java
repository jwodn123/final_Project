package com.jeju.JejuBnB.message.model.vo;

import java.sql.Date;

public class Message_Detail implements java.io.Serializable{
	private static final long serialVersionUID = 1115L;
	
	private int message_no;
	private String content;
	private java.sql.Date message_date;
	private String writer;
	public Message_Detail() {
		super();
	}
	public Message_Detail(int message_no, String content, Date message_date, String writer) {
		super();
		this.message_no = message_no;
		this.content = content;
		this.message_date = message_date;
		this.writer = writer;
	}
	public int getMessage_no() {
		return message_no;
	}
	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.sql.Date getMessage_date() {
		return message_date;
	}
	public void setMessage_date(java.sql.Date message_date) {
		this.message_date = message_date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Message_Detail [message_no=" + message_no + ", content=" + content + ", message_date=" + message_date
				+ ", writer=" + writer + "]";
	}
	
}
