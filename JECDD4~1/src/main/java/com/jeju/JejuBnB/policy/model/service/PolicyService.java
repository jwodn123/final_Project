package com.jeju.JejuBnB.policy.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.policy.model.vo.Policy;

public interface PolicyService {
	ArrayList<Policy> selectList();
	int insertPolicy(Policy policy);
	int deletePolicy(String policy_no);
}
