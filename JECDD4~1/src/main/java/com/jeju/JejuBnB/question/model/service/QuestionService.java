package com.jeju.JejuBnB.question.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.question.model.vo.Question;
import com.jeju.JejuBnB.question.model.vo.Question_Type;

public interface QuestionService {
	ArrayList<Question>selectList();
	ArrayList<Question_Type>allList();
	ArrayList<Question>selectSearchUserId(String keyword);
	Question selectDetail(int question_no);
	int insertMyQuestion(Question question);
	ArrayList<Question_Type> selectType(int qtype);
	int updateQuestion(Question question);
}
