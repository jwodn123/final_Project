package com.jeju.JejuBnB.tourReview.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.tour.model.vo.Tour;
import com.jeju.JejuBnB.tourReview.model.vo.Tour_Review;

public interface TourReviewService {
	ArrayList<Tour_Review> selectReview(int tour_no);
	int insertReview(Tour_Review tour_review);
	int updateReview(Tour_Review tour_review);
	int deleteReview(int tour_review_no);
	ArrayList<Tour_Review> selectReviewList(ArrayList<Tour>list);

}
