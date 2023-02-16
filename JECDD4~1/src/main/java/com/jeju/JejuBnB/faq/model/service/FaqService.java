package com.jeju.JejuBnB.faq.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.faq.model.vo.Faq;
import com.jeju.JejuBnB.faq.model.vo.FaqPlus;

public interface FaqService {
	ArrayList<FaqPlus> selectList();
	int InsertFaq(Faq faq);
	int deleteFaq(String faq_no);
	ArrayList<FaqPlus> top7List();
	int updateCount(Faq faq);
}
