package com.jeju.JejuBnB.tour.model.vo;

import java.sql.Date;

public class Tour_Review implements java.io.Serializable{
	private static final long serialVersionUID = 5555;

	private int tour_review_no;
	private String tour_review_content;
	private java.sql.Date tour_review_date;
	private int tour_score;
	private int tour_no;
	private String user_id;
	
	public Tour_Review() {}

	public Tour_Review(int tour_review_no, String tour_review_content, Date tour_review_date, int tour_score,
			int tour_no, String user_id) {
		super();
		this.tour_review_no = tour_review_no;
		this.tour_review_content = tour_review_content;
		this.tour_review_date = tour_review_date;
		this.tour_score = tour_score;
		this.tour_no = tour_no;
		this.user_id = user_id;
	}

	public int getTour_review_no() {
		return tour_review_no;
	}

	public void setTour_review_no(int tour_review_no) {
		this.tour_review_no = tour_review_no;
	}

	public String getTour_review_content() {
		return tour_review_content;
	}

	public void setTour_review_content(String tour_review_content) {
		this.tour_review_content = tour_review_content;
	}

	public java.sql.Date getTour_review_date() {
		return tour_review_date;
	}

	public void setTour_review_date(java.sql.Date tour_review_date) {
		this.tour_review_date = tour_review_date;
	}

	public int getTour_score() {
		return tour_score;
	}

	public void setTour_score(int tour_score) {
		this.tour_score = tour_score;
	}

	public int getTour_no() {
		return tour_no;
	}

	public void setTour_no(int tour_no) {
		this.tour_no = tour_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Tour_Review [tour_review_no=" + tour_review_no + ", tour_review_content=" + tour_review_content
				+ ", tour_review_date=" + tour_review_date + ", tour_score=" + tour_score + ", tour_no=" + tour_no
				+ ", user_id=" + user_id + "]";
	}	
}
