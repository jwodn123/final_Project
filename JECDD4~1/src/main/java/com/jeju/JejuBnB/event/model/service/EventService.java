package com.jeju.JejuBnB.event.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.event.model.vo.Collection;
import com.jeju.JejuBnB.event.model.vo.Event;




public interface EventService {
	ArrayList<Collection> selectList(int currentPage, int limit);
	int getListCount();
	int insertEvent(Event event);
	int updateEvent(Event event);
	int deleteEvent(String event_no);
	Collection selectEvent(int event_no);
	
}
