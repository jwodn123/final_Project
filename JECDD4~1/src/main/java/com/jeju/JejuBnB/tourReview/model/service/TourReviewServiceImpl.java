package com.jeju.JejuBnB.tourReview.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.tour.model.vo.Tour;
import com.jeju.JejuBnB.tourReview.model.dao.TourReviewDao;
import com.jeju.JejuBnB.tourReview.model.vo.Tour_Review;

@Service("tourReviewService")
public class TourReviewServiceImpl implements TourReviewService {
	
	@Autowired
	private TourReviewDao tourReviewDao;

	@Override
	public ArrayList<Tour_Review> selectReview(int tour_no) {
		return tourReviewDao.selectReview(tour_no);
	}

	@Override
	public int insertReview(Tour_Review tour_review) {
		return tourReviewDao.insertReview(tour_review);
	}

	@Override
	public int updateReview(Tour_Review tour_review) {
		return tourReviewDao.updateReview(tour_review);
	}

	@Override
	public int deleteReview(int tour_review_no) {
	    return tourReviewDao.deleteReview(tour_review_no);
	}

	@Override
	public ArrayList<Tour_Review> selectReviewList(ArrayList<Tour> list) {
		return tourReviewDao.selectReviewList(list);
	}


}
