package com.jeju.JejuBnB.account.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.account.model.dao.AccountDao;
import com.jeju.JejuBnB.account.model.vo.Account;
import com.jeju.JejuBnB.review.model.vo.Review;

@Service("accountService")
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	public AccountDao accountDao;
	
	@Override
	public int insertAccount(Account acc) {
		return accountDao.insertAcc(acc);
	}

	@Override
	public Account selectOne(int room_no) {
		return accountDao.selectOne(room_no);
	}

}
