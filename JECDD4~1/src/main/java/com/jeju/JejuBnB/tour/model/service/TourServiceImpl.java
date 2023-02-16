package com.jeju.JejuBnB.tour.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.tour.model.dao.TourDao;
import com.jeju.JejuBnB.tour.model.vo.Tour;
import com.jeju.JejuBnB.tour.model.vo.Tour_Category;
import com.jeju.JejuBnB.tour.model.vo.Tour_Image;

@Service("tourService")
public class TourServiceImpl implements TourService {
	
	@Autowired
	private TourDao tourDao;

	@Override
	public ArrayList<Tour> selectTour(int currentPage, int limit) {
		return tourDao.selectTour(currentPage, limit);
	}

	@Override
	public ArrayList<Tour> SelectSearchTour(Tour tour) {
		return tourDao.selectSearchTour(tour);
	}

	@Override
	public ArrayList<Tour> SelectOrderBy(int currentPage, int limit, int orderby) {
		return tourDao.selectOrderBy(currentPage, limit, orderby);
	}

	@Override
	public Tour SelectTourDetail(int tour_no) {
		return tourDao.selectTourDetail(tour_no);
	}

	@Override
	public Tour SelectTourLike(int count) {
		return tourDao.selectTourLike(count);
	}

	@Override
	public int insertTour(Tour tour) {
		return tourDao.insertTour(tour);
	}

	@Override
	public int updateTour(Tour tour) {
		return tourDao.updateTour(tour);
	}

	@Override
	public int deleteTour(int tour_no) {
		return tourDao.deleteTour(tour_no);
	}

	@Override
	public int deleteTourReview(int tour_review_no) {
		return tourDao.deleteTourReview(tour_review_no);
	}

	@Override
	public int updateTourReadCount(int tour_no) {
		return tourDao.updateTourReadCount(tour_no);
	}

	@Override
	public ArrayList<Tour_Image> selectTourImage(int touno) {
		return tourDao.selectTourImage(touno);
	}

	@Override
	public int insertTourImage(ArrayList<Tour_Image> tilist) {
		return tourDao.insertTourImage(tilist);
	}

	@Override
	public Tour selectTourNo(String user_id) {
		return tourDao.selectTourNo(user_id);
	}

	@Override
	public Tour SelectTourScore(int tour_score) {
		return tourDao.selectTourScore(tour_score);
	}


	@Override
	public ArrayList<Tour_Category> selectTourCategoryName(ArrayList<Tour> list) {
		return tourDao.selectTourCategoryName(list);
	}

}
