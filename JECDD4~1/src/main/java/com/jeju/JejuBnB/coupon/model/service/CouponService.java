package com.jeju.JejuBnB.coupon.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.coupon.model.vo.Coupon;

public interface CouponService {
	ArrayList<Coupon> selectList();
	int insertCoupon(Coupon coupon);
	int deleteCoupon(String coupon_no);
	int deleteCouponAuto(Coupon coupon);
}
