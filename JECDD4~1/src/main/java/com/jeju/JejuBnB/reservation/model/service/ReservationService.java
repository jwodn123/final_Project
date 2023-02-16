package com.jeju.JejuBnB.reservation.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.mycoupon.model.vo.MyCoupon;
import com.jeju.JejuBnB.reservation.model.vo.Reservation;
import com.jeju.JejuBnB.room.model.vo.Room;

public interface ReservationService {

	
	int insertReserv(Reservation reserv);  
	int updateReserv(Reservation reserv);
	Reservation selectCheck(int room_no);
	Reservation selectReserv();
	Reservation selectReserv2(int re_num);
	
	ArrayList<MyCoupon> selectCoupon(String user_id);
	int updateStateCoupon(Reservation reservation);
	
}
