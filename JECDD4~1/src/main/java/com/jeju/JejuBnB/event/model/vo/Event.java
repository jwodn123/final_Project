package com.jeju.JejuBnB.event.model.vo;

public class Event implements java.io.Serializable{
	private static final long serialVersionUID = 2010L;
	
	private int event_no;
	private String event_name;
	private String event_content;
	private String event_fimg;
	private String event_rimg;
	private int coupon_no;
	private String sum_fimg;
	private String sum_rimg;
	
	public Event() {}

	public Event(int event_no, String event_name, String event_content, String event_fimg, String event_rimg,
			int coupon_no, String sum_fimg, String sum_rimg) {
		super();
		this.event_no = event_no;
		this.event_name = event_name;
		this.event_content = event_content;
		this.event_fimg = event_fimg;
		this.event_rimg = event_rimg;
		this.coupon_no = coupon_no;
		this.sum_fimg = sum_fimg;
		this.sum_rimg = sum_rimg;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Event [event_no=" + event_no + ", event_name=" + event_name + ", event_content=" + event_content
				+ ", event_fimg=" + event_fimg + ", event_rimg=" + event_rimg + ", coupon_no=" + coupon_no
				+ ", sum_fimg=" + sum_fimg + ", sum_rimg=" + sum_rimg + "]";
	}
	
}
