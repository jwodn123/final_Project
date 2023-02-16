package com.jeju.JejuBnB.room.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.room.model.vo.PageCount;
import com.jeju.JejuBnB.room.model.vo.Room;
import com.jeju.JejuBnB.room.model.vo.RoomLatLng;
import com.jeju.JejuBnB.room.model.vo.Room_File;

@Repository("roomDao")
public class RoomDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 예약 여부 상관없이 숙소 조회
	public ArrayList<Room> selectList(int currentPage, int limit) {
		PageCount pageCount = new PageCount();		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		pageCount.setStartRow(startRow);
		pageCount.setEndRow(endRow);
		List<Room> list = session.selectList("roomMapper.selectList", pageCount);
		return (ArrayList<Room>) list;
	}
	
	// 지도없이 리스트 보기
	public ArrayList<Room> selectBList(int currentPage, int limit) {
		PageCount pageCount = new PageCount();		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		pageCount.setStartRow(startRow);
		pageCount.setEndRow(endRow);
		List<Room> list = session.selectList("roomMapper.selectBList", pageCount);
		return (ArrayList<Room>) list;
	}
	
	// 숙소 사진 select
	public ArrayList<Room_File> selectRoomFile(int roomno) {
		List<Room_File> rflist = session.selectList("roomMapper.selectRoomFile", roomno);
		return (ArrayList<Room_File>) rflist;
	}
	
	// 숙소 등록
	public int insertRoom(Room room) {
		return session.insert("roomMapper.insertRoom", room);
	}
	
	// 숙소 사진 저장
	public int insertRoomFile(ArrayList<Room_File> rflist) {
		int result = 0;
		for(int i = 0; i < rflist.size(); i++) {
			result += session.insert("roomMapper.insertRoomFile", rflist.get(i));
		}
			
		if(!(rflist.size()-1 == result)) {
			result = 0;
		}
		return result;
	}
	
	// 숙소 수정
	public int updateRoom(Room room) {
		return session.update("roomMapper.updateRoom", room);
	}
	
	// 숙소 삭제
	public int deleteRoom(int room_no) {
		int result = 0;
		int selectReviewCount = session.selectOne("roomMapper.selectReviewCount", room_no);
		if (selectReviewCount > 0) {
			int roomfile = session.delete("roomMapper.deleteRoomFile", room_no);
			int review = session.delete("roomMapper.deleteRoomRivew", room_no);
			int room = session.delete("roomMapper.deleteRoom", room_no);

			if (roomfile > 0 && room > 0 && review > 0) {
				result = room;
			} 
			
		} else {
			int roomfile = session.delete("roomMapper.deleteRoomFile", room_no);
			int room = session.delete("roomMapper.deleteRoom", room_no);

			if (roomfile > 0 && room > 0) {
				result = room;
			} 
		}
		return result;
	}

	// 회원 숙소 조회
	public ArrayList<Room> selectUserRoom(String userid) {
		List<Room> list = session.selectList("roomMapper.selectUserRoom", userid);
		return (ArrayList<Room>)list;
	}
	
	// 숙소번호로 숙소 하나 조회(디테일뷰 or 수정뷰)
	public Room selectRoom(int roomno) {
		return session.selectOne("roomMapper.selectRoom", roomno);
	}

	// 회원이 쓴 글중에 최신글 번호 조회
	public int selectRoomNo(String userid) {
		return session.selectOne("roomMapper.selectRoomNo", userid);
	}


	// 숙소 조회 갯수
	public int getListCount(RoomLatLng seR, RoomLatLng neR, ArrayList<Room> roomNo) {
		HashMap hm = new HashMap();
			hm.put("seR", seR);
			hm.put("neR", neR);				
			hm.put("list", roomNo);
		
			return session.selectOne("roomMapper.getListCount", hm);
				
	}
	
	// 체크인 체크아웃 인원 입력하고 검색했을때 리스트 조회
	public ArrayList<Room> selectChkList(ArrayList<Room> room, int currentPage, int limit) {
		HashMap hm = new HashMap();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;		
		hm.put("list", room);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		List<Room> list = session.selectList("roomMapper.selectChkList", hm);
		return (ArrayList<Room>) list;
	}
	
	// 예약된 숙소 번호 조회하기
	public ArrayList<Room> selectChkRNList(String checkin, String checkout, int people) {
		HashMap hm = new HashMap();
		hm.put("checkin", checkin);
		hm.put("checkout", checkout);
		hm.put("people", people);
		List<Room> list = session.selectList("roomMapper.selectChkRNList", hm);
		return (ArrayList<Room>)list;
	}
	
	// ???
	public ArrayList<Room> selectSysdate() {
		List<Room> list = session.selectList("roomMapper.selectSysdate");
		return (ArrayList<Room>)list;
	}
	
	// 숙소 번호에 해당하는 사진들 조회
	public ArrayList<Room_File> selectRoomFileList(ArrayList<Room> list) {
		List<Room_File> rlist = session.selectList("roomMapper.selectRoomFileList", list);
		return (ArrayList<Room_File>)rlist;
	}

	// 사장님 등록후 글 통과여부 수정
	public int updateRoomChangePass(String user_id) {
		return session.update("roomMapper.updateRoomChangePass", user_id);
	}

	// 숙소 사진 삭제
	public int deleteRoomFile(Room_File rfile) {
		return session.delete("roomMapper.deleteRoomFile", rfile);
	}
	
	// 숙소 위도 경도 입력
	public int insertRoomLatLnt(RoomLatLng rll) {
		return session.insert("roomMapper.insertRoomLatLnt", rll);
	}

	// 숙소 위도경도 테이블에서 데이터 조회
	public ArrayList<RoomLatLng> selectRoomLatLng() {
		List<RoomLatLng> roomlist = session.selectList("roomMapper.selectRoomLatLng");
		return (ArrayList<RoomLatLng>)roomlist;
	}

	public ArrayList<Room> selectLatLng(ArrayList<Room> room, int currentPage, int limit, RoomLatLng seR,
			RoomLatLng neR) {
		HashMap hm = new HashMap();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		hm.put("list", room);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("seR", seR);
		hm.put("neR", neR);
		List<Room> list = session.selectList("roomMapper.selectLatLng", hm);
		return (ArrayList<Room>)list;
	}

	public ArrayList<Room> selectLatLngJustList(int currentPage, int limit, RoomLatLng seR, RoomLatLng neR) {
		HashMap hm = new HashMap();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;		
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("seR", seR);
		hm.put("neR", neR);
		List<Room> list = session.selectList("roomMapper.selectLatLngJustList", hm);
		return (ArrayList<Room>)list;
	}

	public ArrayList<Room> selectSearchLatLng(Room room, ArrayList<Room> roomNo, int currentPage, int limit,
			RoomLatLng seR, RoomLatLng neR) {
		HashMap hm = new HashMap();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;		
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("seR", seR);
		hm.put("neR", neR);
		hm.put("roomNo", roomNo);
		hm.put("bed", room.getBed());
		hm.put("bedroom", room.getBedroom());
		hm.put("bathroom", room.getBathroom());
		if(room.getAmenity() != null) {
			ArrayList<String> amenitylist = new ArrayList<String>();
			String [] amenity = room.getAmenity().split(",");
			for (int i = 0; i < amenity.length; i++) {
				amenitylist.add(amenity[i]);
			}
			hm.put("alist", amenitylist);
		}
		
		if(room.getFacility() != null) {
			ArrayList<String> facilitylist = new ArrayList<String>();
			String [] fecility = room.getFacility().split(",");
			for(int i = 0; i < fecility.length; i++) {
				facilitylist.add(fecility[i]);
			}
			hm.put("flist", facilitylist);

		}
		
		if(room.getBuild_type() != null) {
			ArrayList<String> buildlist = new ArrayList<String>();
			String [] build = room.getBuild_type().split(",");
			for(int i = 0; i < build.length; i++) {
				buildlist.add(build[i]);
			}
			hm.put("blist", buildlist);
		}
		
		if(room.getRule() != null) {
			ArrayList<String> rulelist = new ArrayList<String>();
			String [] rule = room.getRule().split(",");
			for(int i = 0; i < rule.length; i++) {
				rulelist.add(rule[i]);
			}
			hm.put("rlist", rulelist);
		}
		List<Room> list = session.selectList("roomMapper.selectSearchLatLng", hm);
		return (ArrayList<Room>)list;
	}

	public ArrayList<Room> selectSearchFilter(Room room, ArrayList<Room> roomNo, int currentPage, int limit,
			int people) {
		HashMap hm = new HashMap();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;		
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);		
		hm.put("roomNo", roomNo);
		hm.put("people", people);
		hm.put("bed", room.getBed());
		hm.put("bedroom", room.getBedroom());
		hm.put("bathroom", room.getBathroom());
		if(room.getAmenity() != null) {
			ArrayList<String> amenitylist = new ArrayList<String>();
			String [] amenity = room.getAmenity().split(",");
			for (int i = 0; i < amenity.length; i++) {
				amenitylist.add(amenity[i]);
			}
			hm.put("alist", amenitylist);
		}
		
		if(room.getFacility() != null) {
			ArrayList<String> facilitylist = new ArrayList<String>();
			String [] fecility = room.getFacility().split(",");
			for(int i = 0; i < fecility.length; i++) {
				facilitylist.add(fecility[i]);
			}
			hm.put("flist", facilitylist);

		}
		
		if(room.getBuild_type() != null) {
			ArrayList<String> buildlist = new ArrayList<String>();
			String [] build = room.getBuild_type().split(",");
			for(int i = 0; i < build.length; i++) {
				buildlist.add(build[i]);
			}
			hm.put("blist", buildlist);
		}
		
		if(room.getRule() != null) {
			ArrayList<String> rulelist = new ArrayList<String>();
			String [] rule = room.getRule().split(",");
			for(int i = 0; i < rule.length; i++) {
				rulelist.add(rule[i]);
			}
			hm.put("rlist", rulelist);
		}
		List<Room> list = session.selectList("roomMapper.selectSearchLatLng", hm);
		return (ArrayList<Room>)list;
	}
	
	public int getListCountOnlyRoom(ArrayList<Room> list) {
		return session.selectOne("roomMapper.getListCountOnlyRoom", list);
	}

	public int selectSearchListCount(Room room, ArrayList<Room> roomNo) {
		HashMap hm = new HashMap();
		hm.put("list", roomNo);
		hm.put("bed", room.getBed());
		hm.put("bedroom", room.getBedroom());
		hm.put("bathroom", room.getBathroom());
		if(room.getAmenity() != null) {
			ArrayList<String> amenitylist = new ArrayList<String>();
			String [] amenity = room.getAmenity().split(",");
			for (int i = 0; i < amenity.length; i++) {
				amenitylist.add(amenity[i]);
			}
			hm.put("alist", amenitylist);
		}
		
		if(room.getFacility() != null) {
			ArrayList<String> facilitylist = new ArrayList<String>();
			String [] fecility = room.getFacility().split(",");
			for(int i = 0; i < fecility.length; i++) {
				facilitylist.add(fecility[i]);
			}
			hm.put("flist", facilitylist);

		}
		
		if(room.getBuild_type() != null) {
			ArrayList<String> buildlist = new ArrayList<String>();
			String [] build = room.getBuild_type().split(",");
			for(int i = 0; i < build.length; i++) {
				buildlist.add(build[i]);
			}
			hm.put("blist", buildlist);
		}
		
		if(room.getRule() != null) {
			ArrayList<String> rulelist = new ArrayList<String>();
			String [] rule = room.getRule().split(",");
			for(int i = 0; i < rule.length; i++) {
				rulelist.add(rule[i]);
			}
			hm.put("rlist", rulelist);
		}
		return session.selectOne("roomMapper.selectSearchListCount",hm);
	}

	public int selectSearchListCountLatLng(RoomLatLng seR, RoomLatLng neR, ArrayList<Room> roomNo, Room room) {
		HashMap hm = new HashMap();
		hm.put("list", roomNo);
		hm.put("seR", seR);
		hm.put("neR", neR);
		if(room.getAmenity() != null) {
			ArrayList<String> amenitylist = new ArrayList<String>();
			String [] amenity = room.getAmenity().split(",");
			for (int i = 0; i < amenity.length; i++) {
				amenitylist.add(amenity[i]);
			}
			hm.put("alist", amenitylist);
		}
		
		if(room.getFacility() != null) {
			ArrayList<String> facilitylist = new ArrayList<String>();
			String [] fecility = room.getFacility().split(",");
			for(int i = 0; i < fecility.length; i++) {
				facilitylist.add(fecility[i]);
			}
			hm.put("flist", facilitylist);

		}
		
		if(room.getBuild_type() != null) {
			ArrayList<String> buildlist = new ArrayList<String>();
			String [] build = room.getBuild_type().split(",");
			for(int i = 0; i < build.length; i++) {
				buildlist.add(build[i]);
			}
			hm.put("blist", buildlist);
		}
		
		if(room.getRule() != null) {
			ArrayList<String> rulelist = new ArrayList<String>();
			String [] rule = room.getRule().split(",");
			for(int i = 0; i < rule.length; i++) {
				rulelist.add(rule[i]);
			}
			hm.put("rlist", rulelist);
		
		}
		return session.selectOne("roomMapper.selectSearchListCount",hm);
	}

	public int deleteRoomFileList(int roomno) {
		return session.delete("roomMapper.deleteRoomFileList", roomno);
	}

	public int deleteReviewList(int roomno) {
		return session.delete("roomMapper.deleteReviewList", roomno);
	}

	public ArrayList<Room> selectTop() {
		List<Room> list = session.selectList("roomMapper.selectTop");
		return (ArrayList<Room>)list;
	}

	public int deleteroomLatLng(int roomno) {
		return session.delete("roomMapper.deleteroomLatLng", roomno);
	}

	public int deleteReservationRoom(int roomno) {
		return session.delete("roomMapper.deleteReservationRoom", roomno);
	}
	
	public ArrayList<Room_File> selectRFile(int room_no) {
		List<Room_File> list = session.selectList("roomMapper.selectRFile", room_no);
		return (ArrayList<Room_File>)list;
	}
}
