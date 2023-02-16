package com.jeju.JejuBnB.message.model.service;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeju.JejuBnB.message.model.dao.MessageDao;
import com.jeju.JejuBnB.message.model.vo.Message;
import com.jeju.JejuBnB.message.model.vo.Message_Detail;

@Service("messageService")
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao messageDao;

	@Override
	public int insertMessage(Message message) {
		return messageDao.insertMessage(message);
	}

	@Override
	public Message selectListMessage(Message message) {
		return messageDao.selectListMessage(message);
	}

	@Override
	public ArrayList<Message_Detail> selectListMessageDetail(Message_Detail message_detail) {
		return messageDao.selectListMessageDetail(message_detail);
	}

	@Override
	public int insertMessageDetail(Message_Detail message_detail) {
		return messageDao.insertMessageDetail(message_detail);
	}

	@Override
	public ArrayList<Message> selectMessageList(Message message) {
		return messageDao.selectMessageList(message);
	}
}
