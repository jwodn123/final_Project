package com.jeju.JejuBnB.policy.model.vo;

public class Policy implements java.io.Serializable{
	private static final long serialVersionUID = 2030L;
	
	private int policy_no;	
	private String policy_type;
	private String policy_title;
	private String policy_content;
	
	public Policy() {}

	public Policy(int policy_no, String policy_type, String policy_title, String policy_content) {
		super();
		this.policy_no = policy_no;
		this.policy_type = policy_type;
		this.policy_title = policy_title;
		this.policy_content = policy_content;
	}

	public int getPolicy_no() {
		return policy_no;
	}

	public void setPolicy_no(int policy_no) {
		this.policy_no = policy_no;
	}

	public String getPolicy_type() {
		return policy_type;
	}

	public void setPolicy_type(String policy_type) {
		this.policy_type = policy_type;
	}

	public String getPolicy_title() {
		return policy_title;
	}

	public void setPolicy_title(String policy_title) {
		this.policy_title = policy_title;
	}

	public String getPolicy_content() {
		return policy_content;
	}

	public void setPolicy_content(String policy_content) {
		this.policy_content = policy_content;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Policy [policy_no=" + policy_no + ", policy_type=" + policy_type + ", policy_title=" + policy_title
				+ ", policy_content=" + policy_content + "]";
	}

	
	
	
}
