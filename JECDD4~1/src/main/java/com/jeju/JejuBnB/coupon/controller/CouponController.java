package com.jeju.JejuBnB.coupon.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.coupon.model.service.CouponService;
import com.jeju.JejuBnB.coupon.model.vo.Coupon;

@Controller
public class CouponController {
	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);
	
	@Autowired
	private CouponService couponService;
	
	@RequestMapping("couponPage.do")
	public ModelAndView CouponListMethod(ModelAndView mv) {
		ArrayList<Coupon> coupon = couponService.selectList();
		
		if(coupon != null) {
			mv.setViewName("coupon/couponListView");;
			mv.addObject("coupon", coupon);
		}else {
			mv.addObject("message", coupon + "쿠폰조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="insertCoupon.do", method=RequestMethod.POST)
	public String couponInsert(Coupon coupon, Model model) {
		
		if(couponService.insertCoupon(coupon) > 0) {
			return "redirect:couponPage.do";
		}else {
			model.addAttribute("message", "쿠폰 등록 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("couponaddPage.do")
	public String moveCouponAddPage() {
		return "coupon/couponaddPage";
	}
	
	@RequestMapping("deleteCoupon.do")
	public String deleteCoupon(@RequestParam("coupon_no")String coupon_no,Model model) {
		int result = couponService.deleteCoupon(coupon_no);
		if(result > 0) {
			return "redirect:/couponPage.do";
		}else {
			model.addAttribute("message", "삭제 실패");
			return "common/error";
		}
	}
	@RequestMapping("deleteCouponAuto.do")
	public void deleteCouponAuto(Coupon coupon ,Model model) {
		
		int result = couponService.deleteCouponAuto(coupon);
	}
}
