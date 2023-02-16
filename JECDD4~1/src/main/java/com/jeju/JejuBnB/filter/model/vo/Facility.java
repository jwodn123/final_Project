package com.jeju.JejuBnB.filter.model.vo;

public class Facility implements java.io.Serializable{

	private static final long serialVersionUID = 6007L;
	
	private int facility_no;
	private String facility_name;
	
	public Facility() {
		
	}

	public Facility(int facility_no, String facility_name) {
		super();
		this.facility_no = facility_no;
		this.facility_name = facility_name;
	}

	public int getFacility_no() {
		return facility_no;
	}

	public void setFacility_no(int facility_no) {
		this.facility_no = facility_no;
	}

	public String getFacility_name() {
		return facility_name;
	}

	public void setFacility_name(String facility_name) {
		this.facility_name = facility_name;
	}

	@Override
	public String toString() {
		return facility_name;
	}
	
	
}
