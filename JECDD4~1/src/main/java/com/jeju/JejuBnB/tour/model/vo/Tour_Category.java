package com.jeju.JejuBnB.tour.model.vo;

public class Tour_Category implements java.io.Serializable{
	private static final long serialVersionUID = 5222L;
	
	private int tour_category_no;
	private String tour_category_name;
	
	public Tour_Category() {}

	public Tour_Category(int tour_category_no, String tour_category_name) {
		super();
		this.tour_category_no = tour_category_no;
		this.tour_category_name = tour_category_name;
	}

	public int getTour_category_no() {
		return tour_category_no;
	}

	public void setTour_category_no(int tour_category_no) {
		this.tour_category_no = tour_category_no;
	}

	public String getTour_category_name() {
		return tour_category_name;
	}

	public void setTour_category_name(String tour_category_name) {
		this.tour_category_name = tour_category_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Tour_Category [tour_category_no=" + tour_category_no + ", tour_category_name=" + tour_category_name
				+ "]";
	}
}
