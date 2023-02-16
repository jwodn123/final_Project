package com.jeju.JejuBnB.filter.model.vo;

public class Build_type implements java.io.Serializable{

	private static final long serialVersionUID = 6006L;
	
	private int bu_type_no;
	private String bu_type_name;
	
	public Build_type() {
		
	}

	public Build_type(int bu_type_no, String bu_type_name) {
		super();
		this.bu_type_no = bu_type_no;
		this.bu_type_name = bu_type_name;
	}

	public int getBu_type_no() {
		return bu_type_no;
	}

	public void setBu_type_no(int bu_type_no) {
		this.bu_type_no = bu_type_no;
	}

	public String getBu_type_name() {
		return bu_type_name;
	}

	public void setBu_type_name(String bu_type_name) {
		this.bu_type_name = bu_type_name;
	}

	@Override
	public String toString() {
		return bu_type_name;
	}
	
	
}
