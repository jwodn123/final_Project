package com.jeju.JejuBnB.filter.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.filter.model.dao.FilterDao;
import com.jeju.JejuBnB.filter.model.vo.Amenity;
import com.jeju.JejuBnB.filter.model.vo.Build_type;
import com.jeju.JejuBnB.filter.model.vo.Facility;
import com.jeju.JejuBnB.filter.model.vo.Rule;

@Service("filterSerivce")
public class FilterServiceImpl implements FilterService{
	
	
	@Autowired
	private FilterDao filterDao;
	
	@Override
	public ArrayList<Amenity> selectAmenity() {
		return filterDao.selectAmenity();
	}

	@Override
	public ArrayList<Build_type> selectBuild_type() {
		return filterDao.selectBuild_type();
	}

	@Override
	public ArrayList<Facility> selectFacility() {
		return filterDao.selectFacility();
		}

	@Override
	public ArrayList<Rule> selectRule() {
		return filterDao.selectRule();
		}

	@Override
	public int insertAmenity(String amenity) {
		return filterDao.insertAmenity(amenity);

	}

	@Override
	public int insertFacility(String facility) {
		return filterDao.insertFacility(facility);

	}

	@Override
	public int insertBuildType(String build_type) {
		return filterDao.insertBuildType(build_type);

	}

	@Override
	public int insertRule(String rule) {
		return filterDao.insertRule(rule);

	}

	@Override
	public int deleteAmenity(int amenityno) {
		return filterDao.deleteAmenity(amenityno);

	}

	@Override
	public int deleteFacility(int facilityno) {
		return filterDao.deleteFacility(facilityno);

	}

	@Override
	public int deleteBuildType(int build_typeno) {
		return filterDao.deleteBuildType(build_typeno);

	}

	@Override
	public int deleteRule(int ruleno) {
		return filterDao.deleteRule(ruleno);

	}

}
