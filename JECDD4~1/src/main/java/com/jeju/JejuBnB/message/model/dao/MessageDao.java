package com.jeju.JejuBnB.message.model.dao;

import java.util.ArrayList;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.jeju.JejuBnB.message.model.vo.Message;
import com.jeju.JejuBnB.message.model.vo.Message_Detail;

@Repository("messageDao")
public class MessageDao {
	@Autowired
	private SqlSessionTemplate session;

	public MessageDao() {
		super();
	}

	public int insertMessage(Message message) {
		return session.insert("messageMapper.insertMessage", message);
	}

	public Message selectListMessage(Message message) {
		return session.selectOne("messageMapper.selectListMessage", message);
	}
	
	public ArrayList<Message> selectMessageList(Message message) {
		List<Message> list = session.selectList("messageMapper.selectMessageList", message);
		return (ArrayList<Message>)list;
	}
	
	//messageDetail 
	public ArrayList<Message_Detail> selectListMessageDetail(Message_Detail message_detail) {
		List<Message_Detail> list = session.selectList("message_detailMapper.selectListMessageDetail", message_detail);
		return (ArrayList<Message_Detail>)list;
	}

	public int insertMessageDetail(Message_Detail message_detail) {
		return session.insert("message_detailMapper.insertMessageDetail", message_detail);
	}

}
