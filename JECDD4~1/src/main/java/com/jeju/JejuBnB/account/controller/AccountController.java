package com.jeju.JejuBnB.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jeju.JejuBnB.account.model.service.AccountService;
import com.jeju.JejuBnB.reservation.model.service.ReservationService;
import com.jeju.JejuBnB.room.model.service.RoomService;

@Controller
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private RoomService roomService;
	
}
