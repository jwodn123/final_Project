package com.jeju.JejuBnB.question.model.vo;

public class Question_Type extends Question implements java.io.Serializable{
	private static final long serialVersionUID = 2041L;
	
	private int questiontype_no;
	private String questiontype_name;
	
	public Question_Type() {}

	public Question_Type(int questiontype_no, String questiontype_name) {
		super();
		this.questiontype_no = questiontype_no;
		this.questiontype_name = questiontype_name;
	}

	public int getQuestiontype_no() {
		return questiontype_no;
	}

	public void setQuestiontype_no(int questiontype_no) {
		this.questiontype_no = questiontype_no;
	}

	public String getQuestiontype_name() {
		return questiontype_name;
	}

	public void setQuestiontype_name(String questiontype_name) {
		this.questiontype_name = questiontype_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Question_Type [questiontype_no=" + questiontype_no + ", questiontype_name=" + questiontype_name + "]";
	}
	
	
}
