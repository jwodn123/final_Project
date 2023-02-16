package com.jeju.JejuBnB.tour.model.vo;

public class Tour_Image implements java.io.Serializable{
	private static final long serialVersionUID = 5333L;

	private int tour_image_no;
	private String tour_original_file;
	private String tour_rename_file;
	private int tour_no;
	
	public Tour_Image( ) {}

	public Tour_Image(int tour_image_no, String tour_original_file, String tour_rename_file, int tour_no) {
		super();
		this.tour_image_no = tour_image_no;
		this.tour_original_file = tour_original_file;
		this.tour_rename_file = tour_rename_file;
		this.tour_no = tour_no;
	}

	public int getTour_image_no() {
		return tour_image_no;
	}

	public void setTour_image_no(int tour_image_no) {
		this.tour_image_no = tour_image_no;
	}

	public String getTour_original_file() {
		return tour_original_file;
	}

	public void setTour_original_file(String tour_original_file) {
		this.tour_original_file = tour_original_file;
	}

	public String getTour_rename_file() {
		return tour_rename_file;
	}

	public void setTour_rename_file(String tour_rename_file) {
		this.tour_rename_file = tour_rename_file;
	}

	public int getTour_no() {
		return tour_no;
	}

	public void setTour_no(int tour_no) {
		this.tour_no = tour_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Tour_Image [tour_image_no=" + tour_image_no + ", tour_original_file=" + tour_original_file
				+ ", tour_rename_file=" + tour_rename_file + ", tour_no=" + tour_no + "]";
	}
}
