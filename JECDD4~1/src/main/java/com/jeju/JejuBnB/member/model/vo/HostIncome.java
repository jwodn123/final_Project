package com.jeju.JejuBnB.member.model.vo;

import java.sql.Date;

public class HostIncome  implements java.io.Serializable{
	private static final long serialVersionUID = 1116L;
	
	private int room_no;
	private String room_name;
	private String guest_id;
	private String room_weekday;
	private String room_weekend;
	private java.sql.Date checkin_date;
	private java.sql.Date checkout_date;
	private String user_id;
	private String payment_status;
	private int re_num;
	public HostIncome() {
		super();
	}
	
	public HostIncome(int room_no, String room_name, String guest_id, String room_weekday, String room_weekend,
			Date checkin_date, Date checkout_date, String user_id, String payment_status, int re_num) {
		super();
		this.room_no = room_no;
		this.room_name = room_name;
		this.guest_id = guest_id;
		this.room_weekday = room_weekday;
		this.room_weekend = room_weekend;
		this.checkin_date = checkin_date;
		this.checkout_date = checkout_date;
		this.user_id = user_id;
		this.payment_status = payment_status;
		this.re_num = re_num;
	}
	
	public String getGuest_id() {
		return guest_id;
	}

	public void setGuest_id(String guest_id) {
		this.guest_id = guest_id;
	}

	public int getRe_num() {
		return re_num;
	}

	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}

	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
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
	public java.sql.Date getCheckin_date() {
		return checkin_date;
	}
	public void setCheckin_date(java.sql.Date checkin_date) {
		this.checkin_date = checkin_date;
	}
	public java.sql.Date getCheckout_date() {
		return checkout_date;
	}
	public void setCheckout_date(java.sql.Date checkout_date) {
		this.checkout_date = checkout_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "HostIncome [room_no=" + room_no + ", room_name=" + room_name + ", guest_id=" + guest_id
				+ ", room_weekday=" + room_weekday + ", room_weekend=" + room_weekend + ", checkin_date=" + checkin_date
				+ ", checkout_date=" + checkout_date + ", user_id=" + user_id + ", payment_status=" + payment_status
				+ ", re_num=" + re_num + "]";
	}
	
	
}
