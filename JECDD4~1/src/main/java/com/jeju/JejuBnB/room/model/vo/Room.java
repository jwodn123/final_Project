package com.jeju.JejuBnB.room.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Room implements java.io.Serializable {
	
	private static final long serialVersionUID = 6001L;
	
	
	private int room_no;
	private String user_id;
	private String room_name;
	private String room_content;
	private String room_address;
	private String room_roadaddress;
	private int st_num_people;
	private int max_people;
	private String checkin_time;
	private String checkout_time;
	private int bed;
	private int bedroom;
	private int bathroom;
	private String amenity;
	private String facility;
	private String build_type;
	private String rule;
	private String pass_or_not;
	private int plus_charge;
	private String room_weekday;
	private String room_weekend;
	
	
	public Room() {
		
	}


	public Room(int room_no, String user_id, String room_name, String room_content, String room_address,
			String room_roadaddress, int st_num_people, int max_people, String checkin_time, String checkout_time,
			int bed, int bedroom, int bathroom, String amenity, String facility, String build_type, String rule,
			String pass_or_not, int plus_charge, String room_weekday, String room_weekend) {
		super();
		this.room_no = room_no;
		this.user_id = user_id;
		this.room_name = room_name;
		this.room_content = room_content;
		this.room_address = room_address;
		this.room_roadaddress = room_roadaddress;
		this.st_num_people = st_num_people;
		this.max_people = max_people;
		this.checkin_time = checkin_time;
		this.checkout_time = checkout_time;
		this.bed = bed;
		this.bedroom = bedroom;
		this.bathroom = bathroom;
		this.amenity = amenity;
		this.facility = facility;
		this.build_type = build_type;
		this.rule = rule;
		this.pass_or_not = pass_or_not;
		this.plus_charge = plus_charge;
		this.room_weekday = room_weekday;
		this.room_weekend = room_weekend;
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


	public String getRoom_name() {
		return room_name;
	}


	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}


	public String getRoom_content() {
		return room_content;
	}


	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}


	public String getRoom_address() {
		return room_address;
	}


	public void setRoom_address(String room_address) {
		this.room_address = room_address;
	}


	public String getRoom_roadaddress() {
		return room_roadaddress;
	}


	public void setRoom_roadaddress(String room_roadaddress) {
		this.room_roadaddress = room_roadaddress;
	}


	public int getSt_num_people() {
		return st_num_people;
	}


	public void setSt_num_people(int st_num_people) {
		this.st_num_people = st_num_people;
	}


	public int getMax_people() {
		return max_people;
	}


	public void setMax_people(int max_people) {
		this.max_people = max_people;
	}


	public String getCheckin_time() {
		return checkin_time;
	}


	public void setCheckin_time(String checkin_time) {
		this.checkin_time = checkin_time;
	}


	public String getCheckout_time() {
		return checkout_time;
	}


	public void setCheckout_time(String checkout_time) {
		this.checkout_time = checkout_time;
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


	public String getAmenity() {
		return amenity;
	}


	public void setAmenity(String amenity) {
		this.amenity = amenity;
	}


	public String getFacility() {
		return facility;
	}


	public void setFacility(String facility) {
		this.facility = facility;
	}


	public String getBuild_type() {
		return build_type;
	}


	public void setBuild_type(String build_type) {
		this.build_type = build_type;
	}


	public String getRule() {
		return rule;
	}


	public void setRule(String rule) {
		this.rule = rule;
	}


	public String getPass_or_not() {
		return pass_or_not;
	}


	public void setPass_or_not(String pass_or_not) {
		this.pass_or_not = pass_or_not;
	}


	public int getPlus_charge() {
		return plus_charge;
	}


	public void setPlus_charge(int plus_charge) {
		this.plus_charge = plus_charge;
	}


	public String getRoom_weekday() {
		return room_weekday;
	}


	public void setRoom_weekday(String room_weekday) {
		this.room_weekday = room_weekday;
	}


	public String getRoom_weekend() {
		return room_weekend;
	}


	public void setRoom_weekend(String room_weekend) {
		this.room_weekend = room_weekend;
	}


	@Override
	public String toString() {
		return "Room [room_no=" + room_no + ", user_id=" + user_id + ", room_name=" + room_name + ", room_content="
				+ room_content + ", room_address=" + room_address + ", room_roadaddress=" + room_roadaddress
				+ ", st_num_people=" + st_num_people + ", max_people=" + max_people + ", checkin_time=" + checkin_time
				+ ", checkout_time=" + checkout_time + ", bed=" + bed + ", bedroom=" + bedroom + ", bathroom="
				+ bathroom + ", amenity=" + amenity + ", facility=" + facility + ", build_type=" + build_type
				+ ", rule=" + rule + ", pass_or_not=" + pass_or_not + ", plus_charge=" + plus_charge + ", room_weekday="
				+ room_weekday + ", room_weekend=" + room_weekend + "]";
	}
	
	

}