package com.jeju.JejuBnB.account.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.account.model.vo.Account;
import com.jeju.JejuBnB.review.model.vo.Review;

@Repository("accountDao")
public class AccountDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public int insertAcc(Account acc) {
		return session.insert("accountMapper.insertAcc", acc);
	}
	
	public Account selectOne(int room_no) {
		return session.selectOne("accountMapper.selectOne", room_no);
	}
	
}
