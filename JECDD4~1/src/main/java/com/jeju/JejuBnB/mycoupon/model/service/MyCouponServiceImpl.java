package com.jeju.JejuBnB.mycoupon.model.service;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jeju.JejuBnB.mycoupon.model.dao.MyCouponDao;
import com.jeju.JejuBnB.mycoupon.model.vo.MyCoupon;

@Service("mycouponService")
public class MyCouponServiceImpl implements MyCouponService{
	@Autowired
	private MyCouponDao mycouponDao;
	
	@Override
	public MyCoupon selectList(MyCoupon mycoupon){
		return mycouponDao.selectList(mycoupon);
	}
	
	@Override
	public int insertMyCoupon(MyCoupon mycoupon) {
		return mycouponDao.insertMyCoupon(mycoupon);
	}

	@Override
	public ArrayList<MyCoupon> selectMyCouponList(MyCoupon mycoupon) {
		return mycouponDao.selectMyCouponList(mycoupon);
	}
	
}
