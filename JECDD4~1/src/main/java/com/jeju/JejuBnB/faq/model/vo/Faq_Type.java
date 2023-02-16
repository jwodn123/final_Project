package com.jeju.JejuBnB.faq.model.vo;

public class Faq_Type implements java.io.Serializable{
	private static final long seriVersionUID = 2021L;
	
	private int faqcategory_no;
	private String faqcategory_name;
	
	public Faq_Type() {}
	
	public Faq_Type(int faqcategory_no, String faqcategory_name) {
		super();
		this.faqcategory_no = faqcategory_no;
		this.faqcategory_name = faqcategory_name;
	}
	public int getFaqcategory_no() {
		return faqcategory_no;
	}
	public void setFaqcategory_no(int faqcategory_no) {
		this.faqcategory_no = faqcategory_no;
	}
	public String getFaqcategory_name() {
		return faqcategory_name;
	}
	public void setFaqcategory_name(String faqcategory_name) {
		this.faqcategory_name = faqcategory_name;
	}
	public static long getSeriversionuid() {
		return seriVersionUID;
	}
	@Override
	public String toString() {
		return "Faq_Type [faqcategory_no=" + faqcategory_no + ", faqcategory_name=" + faqcategory_name + "]";
	}
	
	
}
