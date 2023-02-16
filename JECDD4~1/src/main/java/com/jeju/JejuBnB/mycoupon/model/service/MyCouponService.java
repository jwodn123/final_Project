package com.jeju.JejuBnB.mycoupon.model.service;

import java.util.ArrayList;
import com.jeju.JejuBnB.mycoupon.model.vo.MyCoupon;

public interface MyCouponService {
	int insertMyCoupon(MyCoupon mycoupon);
	MyCoupon selectList(MyCoupon mycoupon);
	ArrayList<MyCoupon> selectMyCouponList(MyCoupon mycoupon);
}
