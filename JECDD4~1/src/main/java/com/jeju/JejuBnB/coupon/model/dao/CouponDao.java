package com.jeju.JejuBnB.coupon.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.coupon.model.vo.Coupon;

@Repository("couponDao")
public class CouponDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public CouponDao() {}
	
	public ArrayList<Coupon> selectList(){
		List<Coupon> list = session.selectList("couponMapper.selectList");
		return (ArrayList<Coupon>)list;
	}
	
	public int insertCoupon(Coupon coupon) {
		return session.insert("couponMapper.insertCoupon", coupon);
	}
	
	public int deleteCoupon(String coupon_no) {
		String [] couponNo = coupon_no.split(",");
		int result = 0;
		for(int i = 0; i < couponNo.length; i++) {
			int count = session.delete("couponMapper.deleteCoupon", couponNo[i]);
			if(count > 0) {
				result++;
			}
		}
		if(result == couponNo.length) {
			return 1;
		}else {
			return 0;
		}
	}

	public int deleteCouponAuto(Coupon coupon) {
		return session.delete("couponMapper.deleteCouponAuto", coupon);
	}
	
}
