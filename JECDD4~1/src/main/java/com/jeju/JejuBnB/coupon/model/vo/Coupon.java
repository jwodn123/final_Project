package com.jeju.JejuBnB.coupon.model.vo;

import java.sql.Date;

public class Coupon implements java.io.Serializable{
	private static final long serialVersionUID = 2000L;
	
	private int coupon_no;
	private int coupon_money;
	private java.sql.Date coupon_begin;
	private java.sql.Date coupon_end;
	
	public Coupon() {}

	public Coupon(int coupon_no, int coupon_money, Date coupon_begin, Date coupon_end) {
		super();
		this.coupon_no = coupon_no;
		this.coupon_money = coupon_money;
		this.coupon_begin = coupon_begin;
		this.coupon_end = coupon_end;
	}

	public int getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}

	public int getCoupon_money() {
		return coupon_money;
	}

	public void setCoupon_money(int coupon_money) {
		this.coupon_money = coupon_money;
	}

	public java.sql.Date getCoupon_begin() {
		return coupon_begin;
	}

	public void setCoupon_begin(java.sql.Date coupon_begin) {
		this.coupon_begin = coupon_begin;
	}

	public java.sql.Date getCoupon_end() {
		return coupon_end;
	}

	public void setCoupon_end(java.sql.Date coupon_end) {
		this.coupon_end = coupon_end;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Coupon [coupon_no=" + coupon_no + ", coupon_money=" + coupon_money + ", coupon_begin=" + coupon_begin
				+ ", coupon_end=" + coupon_end + "]";
	}


}
