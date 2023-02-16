package com.jeju.JejuBnB.tourReview.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeju.JejuBnB.tour.controller.TourController;
import com.jeju.JejuBnB.tour.model.service.TourService;
import com.jeju.JejuBnB.tourReview.model.service.TourReviewService;
import com.jeju.JejuBnB.tourReview.model.vo.Tour_Review;

public class TourReviewController {
	private static final Logger logger = LoggerFactory.getLogger(TourController.class);
	
	@Autowired
	private TourReviewService tourReviewService;
	
	@Autowired
	private TourService tourService;
	
	@RequestMapping(value="trinsert.do", method=RequestMethod.POST)
	public String trinsertMethod(@RequestParam(value="tour_no") int tour_no, Tour_Review tour_review, Model model) {
		logger.info("tourReview : "  + tour_review.toString());
		tourReviewService.insertReview(tour_review);
		model.addAttribute("tourReview",tour_review);
		return "redirect:/tdetail.do?tour_no="+tour_no;
	}

}
