package com.jeju.JejuBnB.message.model.service;

import java.util.ArrayList;
import com.jeju.JejuBnB.message.model.vo.Message;
import com.jeju.JejuBnB.message.model.vo.Message_Detail;

public interface MessageService {

	int insertMessage(Message message);
	Message selectListMessage(Message message);
	ArrayList<Message> selectMessageList(Message message);
	ArrayList<Message_Detail> selectListMessageDetail(Message_Detail message_detail);
	int insertMessageDetail(Message_Detail message_detail);

}
