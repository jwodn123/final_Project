package com.jeju.JejuBnB.member.model.vo;

public class HostMemberRoomDetail {
	private int room_no;
	private String user_id;
	private String user_name;
	private String room_name;
	private String room_address;
	private String phone;
	private String host_check;
	private String rename_file;
	public HostMemberRoomDetail() {
		super();
	}
	
	public HostMemberRoomDetail(int room_no, String user_id, String user_name, String room_name, String room_address,
			String phone, String host_check, String rename_file) {
		super();
		this.room_no = room_no;
		this.user_id = user_id;
		this.user_name = user_name;
		this.room_name = room_name;
		this.room_address = room_address;
		this.phone = phone;
		this.host_check = host_check;
		this.rename_file = rename_file;
	}

	public String getRename_file() {
		return rename_file;
	}

	public void setRename_file(String rename_file) {
		this.rename_file = rename_file;
	}

	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_address() {
		return room_address;
	}
	public void setRoom_address(String room_address) {
		this.room_address = room_address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHost_check() {
		return host_check;
	}
	public void setHost_check(String host_check) {
		this.host_check = host_check;
	}

	@Override
	public String toString() {
		return "HostMemberRoomDetail [room_no=" + room_no + ", user_id=" + user_id + ", user_name=" + user_name
				+ ", room_name=" + room_name + ", room_address=" + room_address + ", phone=" + phone + ", host_check="
				+ host_check + ", rename_file=" + rename_file + "]";
	}
	
	
}
