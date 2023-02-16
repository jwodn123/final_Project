package com.jeju.JejuBnB.message.model.vo;

public class Message implements java.io.Serializable{
	private static final long serialVersionUID = 1114L;
	
	private int message_no; 
	private String user_one;
	private String user_two;
	
	public Message() {
		super();
	}

	public Message(int message_no, String user_one, String user_two) {
		super();
		this.message_no = message_no;
		this.user_one = user_one;
		this.user_two = user_two;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String getUser_one() {
		return user_one;
	}

	public void setUser_one(String user_one) {
		this.user_one = user_one;
	}

	public String getUser_two() {
		return user_two;
	}

	public void setUser_two(String user_two) {
		this.user_two = user_two;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Message [message_no=" + message_no + ", user_one=" + user_one + ", user_two=" + user_two + "]";
	}
	
}	
