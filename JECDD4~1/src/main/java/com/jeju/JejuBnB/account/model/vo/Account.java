package com.jeju.JejuBnB.account.model.vo;

public class Account implements java.io.Serializable{
	private static final long serialVersionUID = 8323L;
	
	private String account_num;
	private String bank_name;
	private int room_no;
	
	public Account() {}

	public Account(String account_num, String bank_name, int room_no) {
		super();
		this.account_num = account_num;
		this.bank_name = bank_name;
		this.room_no = room_no;
	}

	public String getAccount_num() {
		return account_num;
	}

	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
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
		return "Account [account_num=" + account_num + ", bank_name=" + bank_name + ", room_no=" + room_no + "]";
	} 
	
	
}
