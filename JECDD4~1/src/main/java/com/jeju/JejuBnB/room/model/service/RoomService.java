package com.jeju.JejuBnB.room.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.room.model.vo.Room;
import com.jeju.JejuBnB.room.model.vo.RoomFilter;
import com.jeju.JejuBnB.room.model.vo.RoomLatLng;
import com.jeju.JejuBnB.room.model.vo.Room_File;

public interface RoomService {
	ArrayList<Room> selectList(int currentPage, int limit);
	ArrayList<Room> selectBList(int currentPage, int limit);
	ArrayList<Room> selectUserRoom(String userid);
	Room selectRoom(int roomno);
	int insertRoom(Room room);
	int updateRoom(Room room);
	int deleteRoom(int room_no);
	int selectRoomNo(String userid);
	int insertRoomFile(ArrayList<Room_File> rflist);
	ArrayList<Room_File> selectRoomFile(int roomno);
	int getListCount(RoomLatLng seR, RoomLatLng neR, ArrayList<Room> roomNo);
	ArrayList<Room> selectChkList(ArrayList<Room> room, int currentPage, int limit);
	ArrayList<Room> selectChkRNList(String checkin, String checkout, int people);
	ArrayList<Room> selectSysdate();
	ArrayList<Room_File> selectRoomFileList(ArrayList<Room> list);
	int updateRoomChangePass(String user_id);
	int deleteRoomFile(Room_File rfile);
	int insertRoomLatLnt(RoomLatLng rll);
	ArrayList<RoomLatLng> selectRoomLatLng();
	ArrayList<Room> selectLatLng(ArrayList<Room> roomNo, int currentPage, int limit, RoomLatLng seR,
			RoomLatLng neR);
	ArrayList<Room> selectLatLngJustList(int currentPage, int limit, RoomLatLng seR, RoomLatLng neR);
	ArrayList<Room> selectSearchLatLng(Room room, ArrayList<Room> roomNo, int currentPage, int limit, RoomLatLng seR, RoomLatLng neR);
	ArrayList<Room> selectSearchFilter(Room room, ArrayList<Room> roomNo, int currentPage, int limit, int people);
	int getListCountOnlyRoom(ArrayList<Room> roomNo);
	int selectSearchListCount(Room room, ArrayList<Room> roomNo);
	int selectSearchListCountLatLng(RoomLatLng seR, RoomLatLng neR, ArrayList<Room> roomNo, Room room);
	int deleteRoomFileList(int roomno);
	int deleteReviewList(int roomno);
	ArrayList<Room> selectTop();
	int deleteroomLatLng(int roomno);
	int deleteReservationRoom(int roomno);
	ArrayList<Room_File> selectRFile(int room_no);
}
