package com.jeju.JejuBnB.reservation.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.mycoupon.model.vo.MyCoupon;
import com.jeju.JejuBnB.reservation.model.vo.Reservation;

@Repository("reservationDao")
public class ReservationDao {
	public ReservationDao() {
	}

	@Autowired
	private SqlSessionTemplate session;

	public int insertReserv(Reservation reserv) {
		return session.insert("reservationMapper.insertReserv", reserv);
	}

	public Reservation selectReserv() {
		return session.selectOne("reservationMapper.selectReserv");
	}

	public int updateReserv(Reservation reserv) {
		return session.update("reservationMapper.updateReserv", reserv);
	}

	public Reservation selectCheck(int room_no) {
		return session.selectOne("reservationMapper.selectCheck", room_no);
	}

	public Reservation selectReserv2(int re_num) {
		return session.selectOne("reservationMapper.selectReserv2", re_num);
	}
	
	public ArrayList<MyCoupon> selectCoupon(String user_id) {
		List<MyCoupon> coulist = session.selectList("reservationMapper.selectCoupon", user_id);
		return (ArrayList<MyCoupon>) coulist;
	}
	
	public int updateStateCoupon(Reservation reservation) {
		return session.update("reservationMapper.updateStateCoupon", reservation);
	}

}
