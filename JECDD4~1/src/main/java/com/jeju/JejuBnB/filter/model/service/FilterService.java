package com.jeju.JejuBnB.filter.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.filter.model.vo.Amenity;
import com.jeju.JejuBnB.filter.model.vo.Build_type;
import com.jeju.JejuBnB.filter.model.vo.Facility;
import com.jeju.JejuBnB.filter.model.vo.Rule;

public interface FilterService {
	ArrayList<Amenity> selectAmenity();
	ArrayList<Build_type> selectBuild_type();
	ArrayList<Facility> selectFacility();
	ArrayList<Rule> selectRule();
	int insertAmenity(String amenity);
	int insertFacility(String facility);
	int insertBuildType(String build_type);
	int insertRule(String rule);
	
	int deleteAmenity(int amenityno);
	int deleteFacility(int facilityno);
	int deleteBuildType(int build_typeno);
	int deleteRule(int ruleno);
	

}
