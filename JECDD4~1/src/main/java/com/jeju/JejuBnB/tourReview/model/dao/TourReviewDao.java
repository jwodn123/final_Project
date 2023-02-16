package com.jeju.JejuBnB.tourReview.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.tour.model.vo.Tour;
import com.jeju.JejuBnB.tourReview.model.vo.Tour_Review;

@Repository("tourReviewDao")
public class TourReviewDao {
	
	public TourReviewDao() {}
	
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Tour_Review> selectReview(int tour_no) {
		List<Tour_Review> list = session.selectList("tourReviewMapper.selectReview", tour_no);
		return(ArrayList<Tour_Review>) list;
	}

	public int insertReview(Tour_Review tour_review) {
		return session.insert("tourReviewMapper.insertReview", tour_review);
	}

	public int updateReview(Tour_Review tour_review) {
		return session.update("tourReviewMapper.updateReview", tour_review);
	}

	public int deleteReview(int tour_review_no) {
		return session.delete("tourReviewMapper.deleteReview", tour_review_no);
	}

	public ArrayList<Tour_Review> selectReviewList(ArrayList<Tour> list) {
		List<Tour_Review> trlist = session.selectList("tourReviewMapper.selectReviewList", list);
		return(ArrayList<Tour_Review>) trlist;
	}

}
