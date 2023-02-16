package com.jeju.JejuBnB.faq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.faq.model.service.FaqService;
import com.jeju.JejuBnB.faq.model.vo.Faq;
import com.jeju.JejuBnB.faq.model.vo.FaqPlus;

@Controller 
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	private FaqService faqService;
	
	@RequestMapping("faqUsing.do")
	public ModelAndView FaqListMethod(ModelAndView mv) {
		ArrayList<FaqPlus>fp = faqService.selectList();
		
		if(fp != null) {
			mv.setViewName("faq/faqListView");
			mv.addObject("faq", fp);
		}else {
			mv.addObject("message", "FAQ 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping("faqTop7.do")
	public ModelAndView Top7List(ModelAndView mv) {
		ArrayList<FaqPlus>fp = faqService.top7List();
		if(fp != null) {
			mv.setViewName("faq/faqTop7ListView");
			mv.addObject("faq", fp);
		}else {
			mv.addObject("message", "FAQ 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping("faqReservation.do")
	public ModelAndView faqReservation(ModelAndView mv) {
		ArrayList<FaqPlus>fp = faqService.selectList();
		
		if(fp != null) {
			mv.setViewName("faq/faqReservationView");
			mv.addObject("faq", fp);
		}else {
			mv.addObject("message", "FAQ 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping("faqSettlement.do")
	public ModelAndView FaqSettlement(ModelAndView mv) {
		ArrayList<FaqPlus>fp = faqService.selectList();
		
		if(fp != null) {
			mv.setViewName("faq/faqSettlementView");
			mv.addObject("faq", fp);
		}else {
			mv.addObject("message", "FAQ 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping("faqCoupon.do")
	public ModelAndView faqCoupon(ModelAndView mv) {
		ArrayList<FaqPlus>fp = faqService.selectList();
		
		if(fp != null) {
			mv.setViewName("faq/faqCouponView");
			mv.addObject("faq", fp);
		}else {
			mv.addObject("message", "FAQ 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping("faqMember.do")
	public ModelAndView faqMember(ModelAndView mv) {
		ArrayList<FaqPlus>fp = faqService.selectList();
		
		if(fp != null) {
			mv.setViewName("faq/faqMemberView");
			mv.addObject("faq", fp);
		}else {
			mv.addObject("message", "FAQ 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="InsertFaq.do", method=RequestMethod.POST)
	public String faqInsert(Faq faq, Model model) {
		
		if(faqService.InsertFaq(faq) > 0) {
			return "redirect:faqUsing.do";
		}else {
			model.addAttribute("message", "등록 실패");
			return "common/error";
		}	
		
	}
	
	@RequestMapping(value="updateCount.do", method=RequestMethod.POST)
	public void updateCount(Faq faq, Model model, HttpServletRequest request, HttpServletResponse response) {
		int count = faqService.updateCount(faq); 
		
		response.setContentType("text/html; charset=utf-8");
		
		try {
			PrintWriter out = response.getWriter();
			if(count > 0) {
				out.append("ok");
				out.flush();
			}else {
				out.append("no");
				out.flush();
			}
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping("deleteFaq.do")
	public String deleteFaq(@RequestParam("faq_no") String faq_no, Model model) {
		logger.info("삭체 할 번호 : " + faq_no);
		int result = faqService.deleteFaq(faq_no);
		if(result > 0) {
			return "redirect:/faqTop7.do";
		}else {
			model.addAttribute("message", "삭제실패");
			return "common/error";
		}
	}
	
	@RequestMapping("moveInsertFaq.do")
	public String moveInsertFaq() {
		return "faq/faqAdd";
	}
	
	
}
