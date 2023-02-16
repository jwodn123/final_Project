package com.jeju.JejuBnB.reservation.model.vo;

import java.sql.Date;

import com.jeju.JejuBnB.mycoupon.model.vo.MyCoupon;

public class Reservation implements java.io.Serializable {
	private static final long serialVersionUID = 7777L;

    private int room_no;
	private int a_num;
	private int c_num;
	private int i_num;
	private java.sql.Date checkin_date;
	private java.sql.Date checkout_date;
	private int re_num;
	private String user_id;
	private String guest;
	private String payment_status;
	
    public Reservation() {}

	public Reservation(int room_no, int a_num, int c_num, int i_num, Date checkin_date, Date checkout_date, int re_num,
			String user_id, String guest, String payment_status) {
		super();
		this.room_no = room_no;
		this.a_num = a_num;
		this.c_num = c_num;
		this.i_num = i_num;
		this.checkin_date = checkin_date;
		this.checkout_date = checkout_date;
		this.re_num = re_num;
		this.user_id = user_id;
		this.guest = guest;
		this.payment_status = payment_status;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public int getA_num() {
		return a_num;
	}

	public void setA_num(int a_num) {
		this.a_num = a_num;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public int getI_num() {
		return i_num;
	}

	public void setI_num(int i_num) {
		this.i_num = i_num;
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

	public int getRe_num() {
		return re_num;
	}

	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGuest() {
		return guest;
	}

	public void setGuest(String guest) {
		this.guest = guest;
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
		return "Reservation [room_no=" + room_no + ", a_num=" + a_num + ", c_num=" + c_num + ", i_num=" + i_num
				+ ", checkin_date=" + checkin_date + ", checkout_date=" + checkout_date + ", re_num=" + re_num
				+ ", user_id=" + user_id + ", guest=" + guest + ", payment_status=" + payment_status + "]";
	}

	
	

	

	
    
    
    
			
}
