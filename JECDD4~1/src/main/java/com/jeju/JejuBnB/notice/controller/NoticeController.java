package com.jeju.JejuBnB.notice.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.notice.model.service.NoticeService;
import com.jeju.JejuBnB.notice.model.vo.Notice;
import com.jeju.JejuBnB.notice.model.vo.User_Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="myNoticeList.do", method=RequestMethod.POST)
	public String selectUserNoticeList(Model model, @RequestParam("userid") String userid, HttpServletResponse response) {
		ArrayList<User_Notice> list = noticeService.selectUserNotice(userid);
		
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(User_Notice Un : list) {
			JSONObject job = new JSONObject();
			job.put("notice_no", Un.getNotice_no());
			try {
				job.put("notice_content", URLEncoder.encode(Un.getNotice_content(),"utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			job.put("notice_date", Un.getNotice_date());
			job.put("to_user", Un.getTo_user());
			job.put("from_user", Un.getFrom_user());
			
			jarr.add(job);
		}
		
		sendJson.put("list", jarr);
		return sendJson.toJSONString();
	
	}
	
	@RequestMapping(value="deleteUNotice.do", method=RequestMethod.POST)
	public String deleteUserNotice(Model model, @RequestParam("noticeno") int noticeno, @RequestParam("userid") String userid) {
		int result = noticeService.deleteUserNotice(noticeno);
		
		if(!(result > 0)) {
			model.addAttribute("message", "????????? ??? ????????????.");
		}
		return "redirect:/myNoticeList.do?userid="+userid;
	}
	
	@RequestMapping(value="deleteNotice.do", method=RequestMethod.POST)
	public String deleteNotice(Model model, Notice notice) {
		
		int result = noticeService.deleteNotice(notice);
		logger.info(""+result);
		if(result > 0) {
			return "redirect:/adNoticeList.do";
		}else {
			return "common/error";
		}
	}
	
	
	
	@RequestMapping("insertNotice.do")
	public ModelAndView insertNotice(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, @RequestParam("returnPage") String returnPage) {
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		int choice = Integer.parseInt(request.getParameter("choice"));
		String toUser = request.getParameter("toUser");
		String fromUser = request.getParameter("fromUser");
		String room_name = request.getParameter("room_name");
		Notice notice;
		Notice notice2;
		User_Notice un1 = new User_Notice();
		User_Notice un2 = new User_Notice();
		int result = 0;
		int result2 = 0;
		/*
		 * choice ??? ?????? ??????
		 * toUser??? ???????????? ??????
		 * fromUser ??? ???????????? ex>????????????
		 * ?????? ???????????? ??????.
		 * XX ??? XX?????? ???????????? => ??????????????? (toUser ??? ?????????  fromUser??? ???????????? ??????)
		 * XX ??? XX?????? ?????? ?????? ?????? => ???????????????  (toUser ??? ????????? fromUser ??? ???????????? ??????.)
		 */
		logger.info(room_name);
		switch(choice) {
		case 1 : 	

			notice = noticeService.selectNotice(choice);
			notice2 = noticeService.selectNotice(choice+1);

			un1.setNotice_content(fromUser +" "+ notice.getNotice_content1() +" " + room_name + " " +notice.getNotice_content2());
			un1.setFrom_user(fromUser);
			un1.setTo_user(toUser);
			result = noticeService.insertUNotice(un1);
			
			un2.setFrom_user(toUser);
			un2.setNotice_content(toUser + " " +notice2.getNotice_content1()+ " " +room_name + " " +notice.getNotice_content2());
			un2.setTo_user(fromUser);
			result2 = noticeService.insertUNotice(un2);
			
			if(result > 0 && result2 > 0) {
				mv.setViewName(returnPage);
			}else{
				mv.addObject("message", "?????? ????????? ??????");
				mv.setViewName("common/error");
			}
			break;
			
		case 3 :
			
			notice = noticeService.selectNotice(choice);

			un1.setNotice_content(room_name + " " +notice.getNotice_content1() + " " +toUser + " " +notice.getNotice_content2());
			un1.setFrom_user(toUser);
			un1.setTo_user(fromUser);
			result = noticeService.insertUNotice(un1);
			
			if(result > 0) {
				mv.setViewName(returnPage);
			}else{
				mv.addObject("message", "?????? ????????? ??????");
				mv.setViewName("common/error");
			}
			break;
			
		case 4 :
			notice = noticeService.selectNotice(choice);

			un1.setNotice_content(fromUser +" " + notice.getNotice_content1() + " " +toUser + " " +notice.getNotice_content2());
			un1.setFrom_user(fromUser);
			un1.setTo_user(toUser);
			result = noticeService.insertUNotice(un1);
			
			if(result > 0) {
				mv.setViewName(returnPage);
			}else{
				mv.addObject("message", "?????? ????????? ??????");
				mv.setViewName("common/error");
			}
			break;			
			
		case 5 :
			String xx = request.getParameter("????????? ?????? ");
			notice = noticeService.selectNotice(choice);

			un1.setNotice_content(fromUser +" " + notice.getNotice_content1() + " " +xx +" " + notice.getNotice_content2());
			un1.setFrom_user("admin");
			un1.setTo_user(fromUser);
			result = noticeService.insertUNotice(un1);
			
			if(result > 0) {
				mv.setViewName(returnPage);
			}else{
				mv.addObject("message", "?????? ????????? ??????");
				mv.setViewName("common/error");
			}
			break;
			
		case 6:
			String xxx = request.getParameter("?????? ?????? ");
			notice = noticeService.selectNotice(choice);

			un1.setNotice_content(fromUser + " " +notice.getNotice_content1() + " " +xxx + " " +notice.getNotice_content2());
			un1.setFrom_user("admin");
			un1.setTo_user(fromUser);
			result = noticeService.insertUNotice(un1);
			
			if(result > 0) {
				mv.setViewName(returnPage);
			}else{
				mv.addObject("message", "?????? ????????? ??????");
				mv.setViewName("common/error");
			}
			break;
		
		case 7:
			notice = noticeService.selectNotice(choice);
			un1.setNotice_content(toUser + " " +notice.getNotice_content1() + " '" +room_name + "' " +notice.getNotice_content2());
			un1.setTo_user(toUser);
			un1.setFrom_user(fromUser);

			result = noticeService.insertUNotice(un1);
			if(result > 0) {
				mv.setViewName(returnPage);
			}else{
				mv.addObject("message", "?????? ????????? ??????");
				mv.setViewName("common/error");
			}
			break;
		}
		return mv;
	}
	
	
	
	@RequestMapping("adNoticeList.do")
	public String AdNoticeList(Model model) {
		ArrayList<Notice> list = noticeService.selectNoticeList();
		if(list.size() > 0) {
			model.addAttribute("list", list);
			return "notice/adNoticeList";
		}else {
			model.addAttribute("message", "?????????  ?????? ??? ?????? ??????");
			return "common/error";
		}
	}
	
	
	
}
