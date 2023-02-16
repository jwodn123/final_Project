package com.jeju.JejuBnB.room.model.vo;

public class CheckTime implements java.io.Serializable{

	private static final long serialVersionUID = 6010L;
	
	private String inhour;
	private String inminute;
	private String outhour;
	private String outminute;
	
	public CheckTime() {
		
	}

	public CheckTime(String inhour, String inminute, String outhour, String outminute) {
		super();
		this.inhour = inhour;
		this.inminute = inminute;
		this.outhour = outhour;
		this.outminute = outminute;
	}

	public String getInhour() {
		return inhour;
	}

	public void setInhour(String inhour) {
		this.inhour = inhour;
	}

	public String getInminute() {
		return inminute;
	}

	public void setInminute(String inminute) {
		this.inminute = inminute;
	}

	public String getOuthour() {
		return outhour;
	}

	public void setOuthour(String outhour) {
		this.outhour = outhour;
	}

	public String getOutminute() {
		return outminute;
	}

	public void setOutminute(String outminute) {
		this.outminute = outminute;
	}

	@Override
	public String toString() {
		return "CheckTime [inhour=" + inhour + ", inminute=" + inminute + ", outhour=" + outhour + ", outminute="
				+ outminute + "]";
	}

	
}
