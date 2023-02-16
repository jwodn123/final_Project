package com.jeju.JejuBnB.question.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.question.model.dao.QuestionDao;
import com.jeju.JejuBnB.question.model.vo.Question;
import com.jeju.JejuBnB.question.model.vo.Question_Type;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService{
	@Autowired
	private QuestionDao questionDao;
	
	@Override
	public ArrayList<Question> selectList(){
		return questionDao.selectList();
	}
	
	@Override
	public ArrayList<Question_Type> allList(){
		return questionDao.allList();
	}
	
	@Override
	public ArrayList<Question> selectSearchUserId(String keyword){
		return questionDao.selectSearchUserId(keyword);
	}
	
	@Override
	public Question selectDetail(int question_no) {
		return questionDao.selectDetail(question_no);
	}
	
	@Override
	public int insertMyQuestion(Question question) {
		return questionDao.insertMyQuestion(question);
	}

	@Override
	public ArrayList<Question_Type> selectType(int qtype) {
		return questionDao.selectType(qtype);
	}

	@Override
	public int updateQuestion(Question question) {
		return questionDao.updateQuestion(question);
	}

}
