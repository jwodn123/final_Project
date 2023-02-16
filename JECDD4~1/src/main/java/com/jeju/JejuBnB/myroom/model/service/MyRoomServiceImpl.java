package com.jeju.JejuBnB.myroom.model.service;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeju.JejuBnB.myroom.model.dao.MyRoomDao;
import com.jeju.JejuBnB.myroom.model.vo.MyRoom;

@Service("myroomService")
public class MyRoomServiceImpl implements MyRoomService {

	@Autowired
	private MyRoomDao myroomDao;
	
	@Override
	public int insertMyRoom(MyRoom mroom) {
		return myroomDao.insertMyRoom(mroom);
	}

	@Override
	public ArrayList<MyRoom> selectMyRoom(String userid) {
		return myroomDao.selectMyRoom(userid);
	}

	@Override
	public int deleteMyRoom(int roomNo) {
		return myroomDao.deleteMyRoom(roomNo);
	}

	@Override
	public ArrayList<MyRoom> selectMyRoom(MyRoom mroom) {
		return myroomDao.selectMyRoom(mroom);
	}

}
