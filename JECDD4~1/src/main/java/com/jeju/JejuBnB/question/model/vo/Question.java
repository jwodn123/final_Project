package com.jeju.JejuBnB.question.model.vo;

import com.jeju.JejuBnB.member.model.vo.Member;

public class Question implements java.io.Serializable{
	private static final long serialVersionUID = 2040L;
	
		
	private int question_no;
	private String question_title;
	private String question_content;
	private String question_rcontent;
	private String question_fimg;
	private String question_rimg;
	private String question_sendemail;
	private String user_id;
	private int questiontype_no;
	
	public Question() {}

	public Question(int question_no, String question_title, String question_rcontent, String question_content,
			String question_fimg, String question_rimg, String question_sendemail, String user_id,
			int questiontype_no) {
		super();
		this.question_no = question_no;
		this.question_title = question_title;
		this.question_rcontent = question_rcontent;
		this.question_content = question_content;
		this.question_fimg = question_fimg;
		this.question_rimg = question_rimg;
		this.question_sendemail = question_sendemail;
		this.user_id = user_id;
		this.questiontype_no = questiontype_no;
	}

	public int getQuestion_no() {
		return question_no;
	}

	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
	}

	public String getQuestion_title() {
		return question_title;
	}

	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}

	public String getQuestion_rcontent() {
		return question_rcontent;
	}

	public void setQuestion_rcontent(String question_rcontent) {
		this.question_rcontent = question_rcontent;
	}

	public String getQuestion_content() {
		return question_content;
	}

	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}

	public String getQuestion_fimg() {
		return question_fimg;
	}

	public void setQuestion_fimg(String question_fimg) {
		this.question_fimg = question_fimg;
	}

	public String getQuestion_rimg() {
		return question_rimg;
	}

	public void setQuestion_rimg(String question_rimg) {
		this.question_rimg = question_rimg;
	}

	public String getQuestion_sendemail() {
		return question_sendemail;
	}

	public void setQuestion_sendemail(String question_sendemail) {
		this.question_sendemail = question_sendemail;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getQuestiontype_no() {
		return questiontype_no;
	}

	public void setQuestiontype_no(int questiontype_no) {
		this.questiontype_no = questiontype_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Question [question_no=" + question_no + ", question_title=" + question_title + ", question_rcontent="
				+ question_rcontent + ", question_content=" + question_content + ", question_fimg=" + question_fimg
				+ ", question_rimg=" + question_rimg + ", question_sendemail=" + question_sendemail + ", user_id="
				+ user_id + ", questiontype_no=" + questiontype_no + "]";
	}

	
	
	
}
