package com.jeju.JejuBnB.reservation.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.mycoupon.model.vo.MyCoupon;
import com.jeju.JejuBnB.reservation.model.dao.ReservationDao;
import com.jeju.JejuBnB.reservation.model.vo.Reservation;
import com.jeju.JejuBnB.room.model.vo.Room;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDao reservationDao;

	@Override
	public int insertReserv(Reservation reserv) {
		return reservationDao.insertReserv(reserv);
	}

	@Override
	public Reservation selectReserv() {
		return reservationDao.selectReserv();
	}
	
	@Override
	public int updateReserv(Reservation reserv) {
		return reservationDao.updateReserv(reserv);
		
	}

	 @Override
	 public Reservation selectCheck(int room_no) { 
		 return reservationDao.selectCheck(room_no);
	 }

	@Override
	public Reservation selectReserv2(int re_num) {
		return reservationDao.selectReserv2(re_num);
	}

	@Override
	public ArrayList<MyCoupon> selectCoupon(String user_id) {
		return reservationDao.selectCoupon(user_id);
	}
	@Override
	public int updateStateCoupon(Reservation reservation) {
		return reservationDao.updateStateCoupon(reservation);
	}

}
