package com.jeju.JejuBnB.mycoupon.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.jeju.JejuBnB.mycoupon.model.service.MyCouponService;
import com.jeju.JejuBnB.mycoupon.model.vo.MyCoupon;


@Controller
public class MyCouponController {
	
	@Autowired
	private MyCouponService mycouponService;
	// 내 쿠폰함 등록
	@RequestMapping("insertMyCoupon.do")
	public String insertMyCoupon(MyCoupon mycoupon, Model model) {
		MyCoupon mycouponlist = mycouponService.selectList(mycoupon);
		if(mycouponlist == null) {
			if(mycouponService.insertMyCoupon(mycoupon) > 0) {
				return "redirect:main.do";
			}else {
				model.addAttribute("message", "쿠폰 등록이 실패 했습니다.");
				return "common/error";
			}
		}else {
			model.addAttribute("message", "중복 되었습니다.");
			return "common/error";
		}
	}
	
	// 내 쿠폰함 보기 페이지 
	@RequestMapping("moveMyCoupon.do")
	public ModelAndView moveMyCoupon(ModelAndView mv, MyCoupon mycoupon) {
		ArrayList<MyCoupon> mycouponlist = mycouponService.selectMyCouponList(mycoupon);
		if(mycouponlist != null) {
			mv.setViewName("member/my_couponPage");
			mv.addObject("mycouponlist", mycouponlist);
		}else {
			mv.addObject("message", "호스트  정보 조회를 실패 했습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}
}
