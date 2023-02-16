package com.jeju.JejuBnB.room.model.vo;

public class Room_File implements java.io.Serializable{

	private static final long serialVersionUID = 6002L;
	
	private int room_file_no;
	private String original_file;
	private String rename_file;
	private int room_no;
	
	
	public Room_File() {
		
	}
	
	

	public Room_File(int room_file_no, String original_file, String rename_file, int room_no) {
		super();
		this.room_file_no = room_file_no;
		this.original_file = original_file;
		this.rename_file = rename_file;
		this.room_no = room_no;
	}



	public int getRoom_file_no() {
		return room_file_no;
	}



	public void setRoom_file_no(int room_file_no) {
		this.room_file_no = room_file_no;
	}



	public String getOriginal_file() {
		return original_file;
	}



	public void setOriginal_file(String original_file) {
		this.original_file = original_file;
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



	@Override
	public String toString() {
		return "Room_File [room_file_no=" + room_file_no + ", original_file=" + original_file + ", rename_file="
				+ rename_file + ", room_no=" + room_no + "]";
	}

	
	
	
}
