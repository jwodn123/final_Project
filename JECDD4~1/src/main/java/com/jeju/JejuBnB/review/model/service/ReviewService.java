package com.jeju.JejuBnB.review.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.review.model.vo.Review;
import com.jeju.JejuBnB.room.model.vo.Room;

public interface ReviewService {
	ArrayList<Review> selectReply(int room_no);
	int insertReview(Review review);
	int updateReview(Review review);
	int deleteReview(int reply_no);
	int updateAvg(int room_no);
	ArrayList<Review> selectReviewList(ArrayList<Room> list);
	Review selectOne(int reply_no);
	Review selectReviewAvg(int room_no);
}
