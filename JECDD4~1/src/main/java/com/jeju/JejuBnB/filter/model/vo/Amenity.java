package com.jeju.JejuBnB.filter.model.vo;

public class Amenity implements java.io.Serializable{

	private static final long serialVersionUID = 6005L;
	
	private int amenity_no;
	private String amenity_name;
	
	public Amenity() {
		
	}

	public Amenity(int amenity_no, String amenity_name) {
		super();
		this.amenity_no = amenity_no;
		this.amenity_name = amenity_name;
	}

	public int getAmenity_no() {
		return amenity_no;
	}

	public void setAmenity_no(int amenity_no) {
		this.amenity_no = amenity_no;
	}

	public String getAmenity_name() {
		return amenity_name;
	}

	public void setAmenity_name(String amenity_name) {
		this.amenity_name = amenity_name;
	}

	@Override
	public String toString() {
		return amenity_name;
	}
	
	
}
