package com.jeju.JejuBnB.room.model.vo;

public class RoomLatLng implements java.io.Serializable{
	
	private static final long serialVersionUID = 6820L;
	
	private int room_no;
	private double room_lat;
	private double room_lng;
	
	public RoomLatLng() {
		
	}

	public RoomLatLng(int room_no, double room_lat, double room_lng) {
		super();
		this.room_no = room_no;
		this.room_lat = room_lat;
		this.room_lng = room_lng;
	}
	
	public RoomLatLng(double room_lat, double room_lng) {
		this.room_lat = room_lat;
		this.room_lng = room_lng;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public double getRoom_lat() {
		return room_lat;
	}

	public void setRoom_lat(double room_lat) {
		this.room_lat = room_lat;
	}

	public double getRoom_lng() {
		return room_lng;
	}

	public void setRoom_lng(double room_lng) {
		this.room_lng = room_lng;
	}

	@Override
	public String toString() {
		return "RoomLatLng [room_no=" + room_no + ", room_lat=" + room_lat + ", room_lng=" + room_lng + "]";
	}
	
	
}
