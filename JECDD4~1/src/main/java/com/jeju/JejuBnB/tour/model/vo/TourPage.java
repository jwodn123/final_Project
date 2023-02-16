package com.jeju.JejuBnB.tour.model.vo;

public class TourPage implements java.io.Serializable{
	public static final long serialVersionUid = 5666L;
	
	
	private int startRow ;
	private int endRow ;
	
	public TourPage() {
		
	}

	public TourPage(int startRow, int endRow) {
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
