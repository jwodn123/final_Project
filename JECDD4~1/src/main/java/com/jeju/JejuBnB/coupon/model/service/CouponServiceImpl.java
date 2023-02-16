package com.jeju.JejuBnB.coupon.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.coupon.model.dao.CouponDao;
import com.jeju.JejuBnB.coupon.model.vo.Coupon;

@Service("couponService")
public class CouponServiceImpl implements CouponService{
	@Autowired
	private CouponDao couponDao;
	
	@Override
	public ArrayList<Coupon>selectList(){
		return couponDao.selectList();
	}
	
	@Override
	public int insertCoupon(Coupon coupon) {
		return couponDao.insertCoupon(coupon);
	}
	
	@Override
	public int deleteCoupon(String coupon_no) {
		return couponDao.deleteCoupon(coupon_no);
	}

	@Override
	public int deleteCouponAuto(Coupon coupon) {
		return couponDao.deleteCouponAuto(coupon);
	}
	
}
