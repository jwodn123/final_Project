package com.jeju.JejuBnB.mycoupon.model.vo;

import com.jeju.JejuBnB.coupon.model.vo.Coupon;

public class MyCoupon extends Coupon implements java.io.Serializable  {
	private static final long serialVersionUID = 1112L;
	private String user_id;
	private int coupon_no;
	
	public MyCoupon() {
		super();
	}

	public MyCoupon(String user_id, int coupon_no) {
		super();
		this.user_id = user_id;
		this.coupon_no = coupon_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "MyCoupon [user_id=" + user_id + ", coupon_no=" + coupon_no + "]";
	}
	
	
}
