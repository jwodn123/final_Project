package com.jeju.JejuBnB.myroom.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.myroom.model.service.MyRoomService;
import com.jeju.JejuBnB.myroom.model.vo.MyRoom;

@Controller
public class MyRoomController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	MyRoomService myroomService;
	
	//내가 저장한 숙소 등록
	@RequestMapping(value="insertMyRoom.do", method=RequestMethod.POST)
	public void insertMyRoom(MyRoom mroom, HttpServletResponse response) {
		int result = myroomService.insertMyRoom(mroom);
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			if(result > 0) {
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
	
	//내가 저장한 숙소 삭제
	@RequestMapping(value="deleteMyRoom.do", method=RequestMethod.POST)
	public void deleteMyRoom(@RequestParam("room_no") int roomNo, HttpServletResponse response) {
		logger.info(""+roomNo);
		int result = myroomService.deleteMyRoom(roomNo);
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			if(result > 0) {
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
	
	//내가 저장한 숙소 출력
	@RequestMapping("seleteMyRoom.do")
	public ModelAndView seleteMyRoom(MyRoom mroom, ModelAndView mv) {
		ArrayList<MyRoom> mlist = myroomService.selectMyRoom(mroom);
		if(mlist != null) {
		mv.addObject("mlist", mlist);
		mv.setViewName("member/myRoom");
		return mv;
		}else {
			mv.addObject("message", "내가 저장한 숙소를 찾지 못했습니다.");
			mv.setViewName("common/error");
		return mv;
		}
	}
}
