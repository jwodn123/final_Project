package com.jeju.JejuBnB.myroom.model.dao;

import java.util.ArrayList;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.jeju.JejuBnB.myroom.model.vo.MyRoom;

@Repository("myroomDao")
public class MyRoomDao {	

	@Autowired
	private SqlSessionTemplate session;
	
	public int insertMyRoom(MyRoom mroom) {
		return session.insert("myroomMapper.insertMyRoom", mroom);
	}

	public ArrayList<MyRoom> selectMyRoom(String userid) {
		List<MyRoom> list = session.selectList("myroomMapper.selectMyRoom", userid);
		return (ArrayList<MyRoom>)list;
	}

	public int deleteMyRoom(int roomNo) {
		return session.delete("myroomMapper.deleteMyRoom", roomNo);
	}

	public ArrayList<MyRoom> selectMyRoom(MyRoom mroom) {
		List<MyRoom> list = session.selectList("myroomMapper.selectMyRoomList", mroom);
		return (ArrayList<MyRoom>)list;
	}

}
