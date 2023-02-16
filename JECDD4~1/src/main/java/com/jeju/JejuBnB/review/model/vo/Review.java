package com.jeju.JejuBnB.review.model.vo;

import java.sql.Date;

public class Review implements java.io.Serializable{

	private static final long serialVersionUID = 9999L;

	private int reply_no;
	private int clean_score;
	private int value_score;
	private int service_score;
	private String review_content;
	private int review_level;
	private int review_ref;
	private int review_seq;
	private int room_no;
	private String user_id;
	private java.sql.Date review_date;
	
	public Review() {}

	public Review(int reply_no, int clean_score, int value_score, int service_score, String review_content,
			int review_level, int review_ref, int review_seq, int room_no, String user_id, Date review_date) {
		super();
		this.reply_no = reply_no;
		this.clean_score = clean_score;
		this.value_score = value_score;
		this.service_score = service_score;
		this.review_content = review_content;
		this.review_level = review_level;
		this.review_ref = review_ref;
		this.review_seq = review_seq;
		this.room_no = room_no;
		this.user_id = user_id;
		this.review_date = review_date;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public int getClean_score() {
		return clean_score;
	}

	public void setClean_score(int clean_score) {
		this.clean_score = clean_score;
	}

	public int getValue_score() {
		return value_score;
	}

	public void setValue_score(int value_score) {
		this.value_score = value_score;
	}

	public int getService_score() {
		return service_score;
	}

	public void setService_score(int service_score) {
		this.service_score = service_score;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_level() {
		return review_level;
	}

	public void setReview_level(int review_level) {
		this.review_level = review_level;
	}

	public int getReview_ref() {
		return review_ref;
	}

	public void setReview_ref(int review_ref) {
		this.review_ref = review_ref;
	}

	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public java.sql.Date getReview_date() {
		return review_date;
	}

	public void setReview_date(java.sql.Date review_date) {
		this.review_date = review_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Review [reply_no=" + reply_no + ", clean_score=" + clean_score + ", value_score=" + value_score
				+ ", service_score=" + service_score + ", review_content=" + review_content + ", review_level="
				+ review_level + ", review_ref=" + review_ref + ", review_seq=" + review_seq + ", room_no=" + room_no
				+ ", user_id=" + user_id + ", review_date=" + review_date + "]";
	}

	

	
	

		
	
}
