package com.jeju.JejuBnB.member.model.vo;


public class Member implements java.io.Serializable {
	private static final long serialVersionUID = 1111L;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String birthday;
	private String phone;
	private String facebook_id;
	private String host_check;
	private String admin_check;
	
	public Member() {
		super();
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Member(String user_id, String user_pwd, String user_name, String birthday, String phone, String facebook_id,
			String host_check, String admin_check) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.birthday = birthday;
		this.phone = phone;
		this.facebook_id = facebook_id;
		this.host_check = host_check;
		this.admin_check = admin_check;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFacebook_id() {
		return facebook_id;
	}

	public void setFacebook_id(String facebook_id) {
		this.facebook_id = facebook_id;
	}

	public String getHost_check() {
		return host_check;
	}

	public void setHost_check(String host_check) {
		this.host_check = host_check;
	}

	public String getAdmin_check() {
		return admin_check;
	}

	public void setAdmin_check(String admin_check) {
		this.admin_check = admin_check;
	}

	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name=" + user_name + ", birthday="
				+ birthday + ", phone=" + phone + ", facebook_id=" + facebook_id + ", host_check=" + host_check
				+ ", admin_check=" + admin_check + "]";
	}
}
