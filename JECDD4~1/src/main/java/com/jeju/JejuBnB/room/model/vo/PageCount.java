package com.jeju.JejuBnB.room.model.vo;

public class PageCount implements java.io.Serializable{
	public static final long serialVersionUid = 6003L;
	
	
	private int startRow ;
	private int endRow ;
	
	public PageCount() {
		
	}

	public PageCount(int startRow, int endRow) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	@Override
	public String toString() {
		return "PageCount [startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	
	
	
}
