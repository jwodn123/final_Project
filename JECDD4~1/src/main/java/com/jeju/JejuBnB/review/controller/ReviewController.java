package com.jeju.JejuBnB.review.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeju.JejuBnB.review.model.service.ReviewService;
import com.jeju.JejuBnB.review.model.vo.Review;
import com.jeju.JejuBnB.room.controller.RoomController;
import com.jeju.JejuBnB.room.model.service.RoomService;
import com.jeju.JejuBnB.room.model.vo.Room;

@Controller
public class ReviewController {
private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private RoomService roomService;
	
	//리뷰 등록 팝업 띄우기
	@RequestMapping(value="rewrite.do", method=RequestMethod.GET)
	public String popupGet(@RequestParam("room_no") int room_no, Model model) throws Exception {		
			model.addAttribute("room_no", room_no);
			return "review/ReviewWriteForm";		
	}
	
	//리뷰 수정 팝업 띄우기
	@RequestMapping(value="rewrite2.do", method=RequestMethod.GET)
	public String updatepop(@RequestParam("room_no") int room_no, @RequestParam("reply_no") int reply_no, Review review, Model model) throws Exception {		
				logger.info("방번호 : " + room_no);
				logger.info("댓글번호 : " + reply_no);
				Review review1 = reviewService.selectOne(reply_no);
				logger.info("리뷰 : " + review1);
				model.addAttribute("review", review1);
				model.addAttribute("room_no", room_no);
				return "review/reviewUpdateForm";		
		}
	
	//별점, 리뷰 등록
	@RequestMapping(value="reinsert.do", method=RequestMethod.POST)
	public String reinsertMethod(@RequestParam(value="room_no") int room_no, Review review, Model model, 
			@RequestParam(value="clean_score") int clean_score, @RequestParam(value="value_score") int value_score,
			@RequestParam(value="service_score") int service_score) {		
			logger.info("review: " + review.toString());	
			reviewService.insertReview(review);	
			//평점 구해서 업데이트 실행 숙소에 대한update
			//int result = reviewService.updateAvg(room_no); //같은 속소리뷰에 대한 점수 합산과 평균구해서 room 에 업데이트 처리
			Room room = roomService.selectRoom(room_no);
			model.addAttribute("review", review);		
			return "redirect:/moveDetailView.do?room_no="+room_no;
	}
	//리뷰 수정
	@RequestMapping(value="reup.do", method=RequestMethod.POST)
	public String replyInsert(@RequestParam(value="room_no") int room_no, Review review, Model model, 
			@RequestParam(value="clean_score") int clean_score, @RequestParam(value="value_score") int value_score,
			@RequestParam(value="service_score") int service_score, int reply_no) {	
	     
			logger.info("review: " + review);
			logger.info("reply: " + reply_no);
			logger.info("content: " + review.getReview_content());
			reviewService.updateReview(review);
			Room room = roomService.selectRoom(room_no);
			model.addAttribute("review", review);	
			return "redirect:/moveDetailView.do?room_no="+room_no;
	}
	
	//리뷰 삭제
	@RequestMapping(value="replydel.do", method=RequestMethod.POST)
	public String replyDelMethod(@RequestParam("room_no") int room_no, int reply_no, Review review, Model model) {
		logger.info("review :" + review);
		logger.info("댓글번호 :" + reply_no);
		reviewService.deleteReview(reply_no);
		model.addAttribute("review", review);
		return "redirect:/moveDetailView.do?room_no="+room_no;
	}
	
	//대댓글 등록
	@RequestMapping(value="rreinsert.do", method=RequestMethod.POST)
	public String rreinsertMethod(@RequestParam(value="room_no") int room_no, Review review, Model model) {	
		     
				logger.info("review: " + review.toString());	
				reviewService.insertReview(review);
				Room room = roomService.selectRoom(room_no);
				model.addAttribute("review", review);	
			
				return "redirect:/moveDetailView.do?room_no="+room_no;
		}

}
