package com.jeju.JejuBnB.question.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.question.model.vo.Question;
import com.jeju.JejuBnB.question.model.vo.Question_Type;

@Repository("questionDao")
public class QuestionDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public QuestionDao() {}
	
	public ArrayList<Question> selectList(){
		List<Question> list = session.selectList("questionMapper.selectList");
		return (ArrayList<Question>)list;
	}
	
	public ArrayList<Question_Type> allList(){
		List<Question_Type> list = session.selectList("questionMapper.allList");
		return (ArrayList<Question_Type>)list;
	}
	
	
	
	public ArrayList<Question> selectSearchUserId(String keyword){
		List<Question> list = session.selectList("questionMapper.allList",keyword);
		return (ArrayList<Question>)list;
	}
	
	public Question selectDetail(int question_no) {
		return session.selectOne("questionMapper.selectDetail", question_no);
	}
	
	public int insertMyQuestion(Question question) {
		return session.insert("questionMapper.insertMyQuestion", question);
	}
	
	public int updateQuestion(Question question) {
		return session.update("questionMapper.updateQuestion", question);
	}	

	public ArrayList<Question_Type> selectType(int qtype) {
		List<Question_Type> list = session.selectList("questionMapper.selectType", qtype);
		return (ArrayList<Question_Type>)list;
	}

}
