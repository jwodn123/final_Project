package com.jeju.JejuBnB.myroom.model.service;

import java.util.ArrayList;
import com.jeju.JejuBnB.myroom.model.vo.MyRoom;

public interface MyRoomService {
	int insertMyRoom(MyRoom mroom);
	ArrayList<MyRoom> selectMyRoom(String userid);
	int deleteMyRoom(int roomNo);
	ArrayList<MyRoom> selectMyRoom(MyRoom mroom);
}
