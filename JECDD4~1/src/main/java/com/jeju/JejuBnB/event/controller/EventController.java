package com.jeju.JejuBnB.event.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.event.model.service.EventService;
import com.jeju.JejuBnB.event.model.vo.Collection;
import com.jeju.JejuBnB.event.model.vo.Event;
import com.sun.org.apache.bcel.internal.generic.NEW;

@Controller
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping("eventPage.do")
	public ModelAndView EventListMethod(HttpServletRequest request ,ModelAndView mv) {
		int limit = 9;
		int currentPage = 1;
		int listCount = eventService.getListCount();
		
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxPage = (int) (((double) listCount / limit) + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		
		ArrayList<Collection> event = eventService.selectList(currentPage, limit);
		
		if(event != null) {
			mv.setViewName("event/eventListView");
			mv.addObject("maxPage", maxPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("listCount", listCount);
			mv.addObject("event", event);
		}else {
			mv.addObject("message", event + "이벤트조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping("eventDetailView.do")
	public ModelAndView moveDetailEvent(ModelAndView mv,@RequestParam("event_no") int event_no) {
		Collection event = eventService.selectEvent(event_no);
		if(event != null) {
			mv.setViewName("event/eventDetailView");
			mv.addObject("event", event);
		}else {
			mv.setViewName("common/error");
			mv.addObject("message", "이벤트 페이지 조회 실패");
		}
		return mv;
	}
	
	@RequestMapping(value="insertEvent.do", method=RequestMethod.POST)
	public String EventInsert(Event event, Model model, MultipartHttpServletRequest mrequest,
			HttpServletRequest request,@RequestParam(value="efile") MultipartFile efile,
			@RequestParam(value="sfile") MultipartFile sfile) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(efile != null) {
			String orgname = efile.getOriginalFilename();
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/eventimg");
			event.setEvent_fimg(efile.getOriginalFilename());
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			rename += "." + efile.getOriginalFilename().substring(efile.getOriginalFilename().lastIndexOf(".") + 1);
			
			try {
				efile.transferTo(new File(savePath + "\\" + rename));
			}catch(IllegalStateException | IOException e){
				e.printStackTrace();
			}
			event.setEvent_fimg(efile.getOriginalFilename());
			event.setEvent_rimg(rename);
		}
		
		if(sfile != null) {
			String orgname1 = sfile.getOriginalFilename();
			
			String savePath1 = request.getSession().getServletContext().getRealPath("resources/eventsum");
			event.setSum_fimg(sfile.getOriginalFilename());
			String rename1 = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			rename1 += "." + sfile.getOriginalFilename().substring(sfile.getOriginalFilename().lastIndexOf(".") + 1);
			
			try {
				sfile.transferTo(new File(savePath1 + "\\" + rename1));
			}catch(IllegalStateException | IOException e){
				e.printStackTrace();
			}
			event.setSum_fimg(sfile.getOriginalFilename());
			event.setSum_rimg(rename1);
		}
	
		int result = eventService.insertEvent(event);
		if(result > 0){	
			return "redirect:eventPage.do";
		}else {
			model.addAttribute("message", event + "이벤트 등록 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("moveUpdateEvent.do")
	public String moveUpdateEvent(Model model,@RequestParam("event_no") int event_no) {
		Collection event = eventService.selectEvent(event_no);
		if(event != null) {
			model.addAttribute("event", event);
			return "event/eventUpdateView";
		}else {
			model.addAttribute("message", "이벤트 수정페이지 출력 실패");
			return "common/error";
		}
	}
	
	
	@RequestMapping(value="updateEvent.do", method=RequestMethod.POST)
	public String UpdateEvent(Event event, Model model, MultipartHttpServletRequest mrequest,
			HttpServletRequest request,@RequestParam(value="efile") MultipartFile efile,
			@RequestParam(value="sfile")MultipartFile sfile) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(efile != null) {
			String orgname = efile.getOriginalFilename();
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/eventimg");
			event.setEvent_fimg(efile.getOriginalFilename());
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			rename += "." + efile.getOriginalFilename().substring(efile.getOriginalFilename().lastIndexOf(".") + 1);
			
			try {
				efile.transferTo(new File(savePath + "\\" + rename));
			}catch(IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			event.setEvent_fimg(efile.getOriginalFilename());
			event.setEvent_rimg(rename);
		}
		
		if(sfile != null) {
			String orgname1 = sfile.getOriginalFilename();
			
			String savePath1 = request.getSession().getServletContext().getRealPath("resources/eventsum");
			event.setSum_fimg(sfile.getOriginalFilename());
			String rename1 = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			rename1 += "." + sfile.getOriginalFilename().substring(sfile.getOriginalFilename().lastIndexOf(".") + 1);
			
			try {
				sfile.transferTo(new File(savePath1 + "\\" + rename1));				
			}catch(IllegalStateException | IOException e){
				e.printStackTrace();
			}
			event.setSum_fimg(sfile.getOriginalFilename());
			event.setSum_rimg(rename1);
			
		}
		
		int result = eventService.updateEvent(event);
		if(result > 0) {
			model.addAttribute("event_no", event.getEvent_no());
			return "redirect:eventDetailView.do";
		}else {
			model.addAttribute("message", "수정 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("deleteEvent.do")
	public String deleteEvent(@RequestParam("event_no")String event_no, Model model) {
		int result = eventService.deleteEvent(event_no);
		if(result > 0) {
			return "redirect:eventPage.do";
		}else {
			model.addAttribute("message", event_no + "삭제 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("insertEventPage.do")
	public String moveCouponAddPage() {
		return "event/insertEventPage";
	}
}
