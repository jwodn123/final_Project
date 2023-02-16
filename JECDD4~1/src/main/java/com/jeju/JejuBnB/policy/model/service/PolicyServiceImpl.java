package com.jeju.JejuBnB.policy.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.policy.model.dao.PolicyDao;
import com.jeju.JejuBnB.policy.model.vo.Policy;

@Service("policyService")
public class PolicyServiceImpl implements PolicyService{
	@Autowired
	private PolicyDao policyDao;
	
	@Override
	public int insertPolicy(Policy policy) {
		return policyDao.insertPolicy(policy);
	}
	
	@Override
	public ArrayList<Policy>selectList(){
		return policyDao.selectList();
	}
	
	@Override
	public int deletePolicy(String policy_no) {
		return policyDao.deletePolicy(policy_no);
	}
	
}
