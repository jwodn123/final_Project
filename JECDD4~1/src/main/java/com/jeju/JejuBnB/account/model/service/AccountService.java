package com.jeju.JejuBnB.account.model.service;

import com.jeju.JejuBnB.account.model.vo.Account;

public interface AccountService {
	
	int insertAccount(Account acc);
	Account selectOne(int room_no);	
}
