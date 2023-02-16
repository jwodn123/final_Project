package com.jeju.JejuBnB.tour.model.vo;

public class Tour_Like implements java.io.Serializable{
	private static final long serialVersionUID = 5444L;
	
	private int tour_no;
	private String user_id;
	private int conut;
	
	public Tour_Like() {}

	public Tour_Like(int tour_no, String user_id, int conut) {
		super();
		this.tour_no = tour_no;
		this.user_id = user_id;
		this.conut = conut;
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

	public int getConut() {
		return conut;
	}

	public void setConut(int conut) {
		this.conut = conut;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Tour_Like [tour_no=" + tour_no + ", user_id=" + user_id + ", conut=" + conut + "]";
	}
}
