package com.jeju.JejuBnB.notice.model.vo;

public class Notice implements java.io.Serializable{

	
	private static final long serialVersionUID = 6020L;
	
	private String notice_type_no;
	private String notice_name;
	private String notice_content1;
	private String notice_content2;

	public Notice() {
		
	}

	public Notice(String notice_type_no, String notice_name, String notice_content1, String notice_content2) {
		super();
		this.notice_type_no = notice_type_no;
		this.notice_name = notice_name;
		this.notice_content1 = notice_content1;
		this.notice_content2 = notice_content2;
	}

	public String getNotice_type_no() {
		return notice_type_no;
	}

	public void setNotice_type_no(String notice_type_no) {
		this.notice_type_no = notice_type_no;
	}

	public String getNotice_name() {
		return notice_name;
	}

	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}

	public String getNotice_content1() {
		return notice_content1;
	}

	public void setNotice_content1(String notice_content1) {
		this.notice_content1 = notice_content1;
	}

	public String getNotice_content2() {
		return notice_content2;
	}

	public void setNotice_content2(String notice_content2) {
		this.notice_content2 = notice_content2;
	}

	@Override
	public String toString() {
		return "Notice [notice_type_no=" + notice_type_no + ", notice_name=" + notice_name + ", notice_content1="
				+ notice_content1 + ", notice_content2=" + notice_content2 + "]";
	}

		
}
