package com.jeju.JejuBnB.myroom.model.vo;

import com.jeju.JejuBnB.room.model.vo.Room;

public class MyRoom extends Room implements java.io.Serializable {
	private static final long serialVersionUID = 1113L;
	private String user_id;
	private int room_no;
	
	public MyRoom() {
		super();
	}

	public MyRoom(String user_id, int room_no) {
		super();
		this.user_id = user_id;
		this.room_no = room_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "MyRoom [user_id=" + user_id + ", room_no=" + room_no + "]";
	}
	
	
}
