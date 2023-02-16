package com.jeju.JejuBnB.filter.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeju.JejuBnB.filter.model.service.FilterService;
import com.jeju.JejuBnB.filter.model.vo.Amenity;
import com.jeju.JejuBnB.filter.model.vo.Build_type;
import com.jeju.JejuBnB.filter.model.vo.Facility;
import com.jeju.JejuBnB.filter.model.vo.Rule;

@Controller
public class FilterController {
	
	@Autowired
	private FilterService filterService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("moveFilterList.do")
	public String moveFilterList(Model model) {
		ArrayList<Amenity> Alist = filterService.selectAmenity();
		ArrayList<Build_type> Blist = filterService.selectBuild_type();
		ArrayList<Facility> Flist = filterService.selectFacility();
		ArrayList<Rule> Rlist = filterService.selectRule();
		model.addAttribute("Alist", Alist);
		model.addAttribute("Blist", Blist);
		model.addAttribute("Flist", Flist);
		model.addAttribute("Rlist", Rlist);
		logger.info(Rlist.toString());
		return "filter/filterListView";
	}
	
	@RequestMapping(value="Ainsert.do", method=RequestMethod.POST)
	public String insertAmenity(@RequestParam("amenity_name") String amenity_name, Model model) {
		int result = filterService.insertAmenity(amenity_name);
		
		if(result > 0) {
			return "redirect:/moveFilterList.do";
		}else {
			model.addAttribute("message", "편의시설 추가 실패");
			return "common/error";
		}
	}
	
	@RequestMapping(value="Adelete.do")
	public String deleteAmenity(@RequestParam("amenity_no") int ano ,Model model) {
		int result = filterService.deleteAmenity(ano);
		
		if(result > 0) {
			return "redirect:/moveFilterList.do";
		}else {
			model.addAttribute("message", "편의시설 삭제 실패");
			return "common/error";
		}
	}
	
	@RequestMapping(value="Finsert.do", method=RequestMethod.POST)
	public String insertFacility(@RequestParam("facility_name") String facility_name, Model model) {
		int result = filterService.insertFacility(facility_name);
		
		if(result > 0) {
			return "redirect:/moveFilterList.do";
		}else {
			model.addAttribute("message", "시설 추가 실패");
			return "common/error";
		}
	}
	
	@RequestMapping(value="Fdelete.do")
	public String deleteFacility(@RequestParam("facility_no") int fno ,Model model) {
		int result = filterService.deleteFacility(fno);
		
		if(result > 0) {
			return "redirect:/moveFilterList.do";
		}else {
			model.addAttribute("message", "시설 삭제 실패");
			return "common/error";
		}
	}
	
	@RequestMapping(value="Dinsert.do", method=RequestMethod.POST)
	public String insertBuildType(@RequestParam("bu_type_name") String bu_type_name, Model model) {
		int result = filterService.insertBuildType(bu_type_name);
		
		if(result > 0) {
			return "redirect:/moveFilterList.do";
		}else {
			model.addAttribute("message", "건물유형 추가 실패");
			return "common/error";
		}
	}
	
	@RequestMapping(value="Bdelete.do")
	public String deleteBuildType(@RequestParam("bu_type_no") int bno ,Model model) {
		int result = filterService.deleteBuildType(bno);
		
		if(result > 0) {
			return "redirect:/moveFilterList.do";
		}else {
			model.addAttribute("message", "건물유형 삭제 실패");
			return "common/error";
		}
	}
	
	@RequestMapping(value="Rinsert.do", method=RequestMethod.POST)
	public String insertRule(@RequestParam("rule_name") String rule_name, Model model) {
		int result = filterService.insertRule(rule_name);
		
		if(result > 0) {
			return "redirect:/moveFilterList.do";
		}else {
			model.addAttribute("message", "이용 규칙 추가 실패");
			return "common/error";
		}
	}
	
	@RequestMapping(value="rdelete.do")
	public String deleteRule(@RequestParam("rule_no") int ruleno ,Model model) {
		int result = filterService.deleteRule(ruleno);
		
		if(result > 0) {
			return "redirect:/moveFilterList.do";
		}else {
			model.addAttribute("message", "이용규칙 삭제 실패");
			return "common/error";
		}
	}
}











