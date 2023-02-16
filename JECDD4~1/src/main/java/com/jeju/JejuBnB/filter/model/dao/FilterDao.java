package com.jeju.JejuBnB.filter.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.filter.model.vo.Amenity;
import com.jeju.JejuBnB.filter.model.vo.Build_type;
import com.jeju.JejuBnB.filter.model.vo.Facility;
import com.jeju.JejuBnB.filter.model.vo.Rule;

@Repository("filterDao")
public class FilterDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Amenity> selectAmenity() {
		List<Amenity> Alist = session.selectList("filterMapper.selectAmenity");
		return (ArrayList<Amenity>)Alist;
	}

	public ArrayList<Build_type> selectBuild_type() {
		List<Build_type> Blist = session.selectList("filterMapper.selectBuT");
		return (ArrayList<Build_type>)Blist;
	}

	public ArrayList<Facility> selectFacility() {
		List<Facility> Flist = session.selectList("filterMapper.selectFacility");
		return (ArrayList<Facility>)Flist;
	}

	public ArrayList<Rule> selectRule() {
		List<Rule> Rlist = session.selectList("filterMapper.selectRule");
		return (ArrayList<Rule>)Rlist;
	}

	public int insertAmenity(String amenity) {
		return session.insert("filterMapper.insertAmenity", amenity);
	}

	public int insertFacility(String facility) {
		return session.insert("filterMapper.insertFacility", facility);

	}

	public int insertBuildType(String buildname) {
		return session.insert("filterMapper.insertBut", buildname);

	}

	public int insertRule(String rule) {
		return session.insert("filterMapper.insertRule", rule);

	}

	public int deleteAmenity(int amenityno) {
		return session.insert("filterMapper.deleteAmenity", amenityno);

	}

	public int deleteFacility(int facilityno) {
		return session.insert("filterMapper.deleteFacility", facilityno);

	}

	public int deleteBuildType(int build_typeno) {
		return session.insert("filterMapper.deleteBuildType", build_typeno);

	}

	public int deleteRule(int ruleno) {
		return session.insert("filterMapper.deleteRule",ruleno );
	}

}
