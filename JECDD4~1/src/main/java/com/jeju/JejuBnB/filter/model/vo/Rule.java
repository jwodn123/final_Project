package com.jeju.JejuBnB.filter.model.vo;

public class Rule implements java.io.Serializable{

	private static final long serialVersionUID = 6008L;
	
	private int rule_no;
	private String rule_name;
	
	public Rule() {
		
	}

	public Rule(int rule_no, String rule_name) {
		super();
		this.rule_no = rule_no;
		this.rule_name = rule_name;
	}

	public int getRule_no() {
		return rule_no;
	}

	public void setRule_no(int rule_no) {
		this.rule_no = rule_no;
	}

	public String getRule_name() {
		return rule_name;
	}

	public void setRule_name(String rule_name) {
		this.rule_name = rule_name;
	}

	@Override
	public String toString() {
		return rule_name;
	}
	
	
}
