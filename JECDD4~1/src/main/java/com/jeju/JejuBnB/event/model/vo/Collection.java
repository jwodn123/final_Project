package com.jeju.JejuBnB.event.model.vo;

import java.sql.Date;

import com.jeju.JejuBnB.coupon.model.vo.Coupon;

public class Collection implements java.io.Serializable{
	
	private static final long serialVersionUID = 9231L;
	
	public Collection() {
		
	}
	
	private int event_no;
	private String event_name;
	private String event_content;
	private String event_fimg;
	private String event_rimg;
	private int coupon_no;
	private String sum_fimg;
	private String sum_rimg;
	private int coupon_money;
	private java.sql.Date coupon_begin;
	private java.sql.Date coupon_end;
	
	public Collection(int event_no, String event_name, String event_content, String event_fimg, String event_rimg,
			int coupon_no, String sum_fimg, String sum_rimg, int coupon_money, Date coupon_begin, Date coupon_end) {
		super();
		this.event_no = event_no;
		this.event_name = event_name;
		this.event_content = event_content;
		this.event_fimg = event_fimg;
		this.event_rimg = event_rimg;
		this.coupon_no = coupon_no;
		this.sum_fimg = sum_fimg;
		this.sum_rimg = sum_rimg;
		this.coupon_money = coupon_money;
		this.coupon_begin = coupon_begin;
		this.coupon_end = coupon_end;
	}
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public String getEvent_fimg() {
		return event_fimg;
	}
	public void setEvent_fimg(String event_fimg) {
		this.event_fimg = event_fimg;
	}
	public String getEvent_rimg() {
		return event_rimg;
	}
	public void setEvent_rimg(String event_rimg) {
		this.event_rimg = event_rimg;
	}
	public int getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getSum_fimg() {
		return sum_fimg;
	}
	public void setSum_fimg(String sum_fimg) {
		this.sum_fimg = sum_fimg;
	}
	public String getSum_rimg() {
		return sum_rimg;
	}
	public void setSum_rimg(String sum_rimg) {
		this.sum_rimg = sum_rimg;
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
	@Override
	public String toString() {
		return "Collection [event_no=" + event_no + ", event_name=" + event_name + ", event_content=" + event_content
				+ ", event_fimg=" + event_fimg + ", event_rimg=" + event_rimg + ", coupon_no=" + coupon_no
				+ ", sum_fimg=" + sum_fimg + ", sum_rimg=" + sum_rimg + ", coupon_money=" + coupon_money
				+ ", coupon_begin=" + coupon_begin + ", coupon_end=" + coupon_end + "]";
	}
	
		
	
}
