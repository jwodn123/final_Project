package com.jeju.JejuBnB.room.model.vo;

public class RoomFilter implements java.io.Serializable{

	private static final long serialVersionUID = 6070L;
	
	private int bed;
	private int bedroom;
	private int bathroom;
	private String amenity_name;
	private String facility_name;
	private String build_name;
	private String rule_name;
	
	public RoomFilter() {
		
	}

	public int getBed() {
		return bed;
	}



	public void setBed(int bed) {
		this.bed = bed;
	}



	public int getBedroom() {
		return bedroom;
	}



	public void setBedroom(int bedroom) {
		this.bedroom = bedroom;
	}



	public int getBathroom() {
		return bathroom;
	}



	public void setBathroom(int bathroom) {
		this.bathroom = bathroom;
	}



	public RoomFilter(int bed, int bedroom, int bathroom, String amenity_name, String facility_name, String build_name,
			String rule_name) {
		super();
		this.bed = bed;
		this.bedroom = bedroom;
		this.bathroom = bathroom;
		this.amenity_name = amenity_name;
		this.facility_name = facility_name;
		this.build_name = build_name;
		this.rule_name = rule_name;
	}



	public String getAmenity_name() {
		return amenity_name;
	}

	public void setAmenity_name(String amenity_name) {
		this.amenity_name = amenity_name;
	}

	public String getFacility_name() {
		return facility_name;
	}

	public void setFacility_name(String facility_name) {
		this.facility_name = facility_name;
	}

	public String getBuild_name() {
		return build_name;
	}

	public void setBuild_name(String build_name) {
		this.build_name = build_name;
	}

	public String getRule_name() {
		return rule_name;
	}

	public void setRule_name(String rule_name) {
		this.rule_name = rule_name;
	}

	@Override
	public String toString() {
		return "RoomFilter [bed=" + bed + ", bedroom=" + bedroom + ", bathroom=" + bathroom + ", amenity_name="
				+ amenity_name + ", facility_name=" + facility_name + ", build_name=" + build_name + ", rule_name="
				+ rule_name + "]";
	}

	
	
}
