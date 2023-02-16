package com.jeju.JejuBnB.faq.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.faq.model.dao.FaqDao;
import com.jeju.JejuBnB.faq.model.vo.Faq;
import com.jeju.JejuBnB.faq.model.vo.FaqPlus;

@Service("faqService")
public class FaqServiceImpl implements FaqService{
	@Autowired
	private FaqDao faqDao;
	
	@Override
	public ArrayList<FaqPlus> selectList(){
		return faqDao.selectList();
	}
	
	@Override
	public ArrayList<FaqPlus> top7List(){
		return faqDao.top7List();
	}
	
	@Override
	public int InsertFaq(Faq faq) {
		return faqDao.InsertFaq(faq);
	}
	
	@Override
	public int deleteFaq(String faq_no) {
		return faqDao.deleteFaq(faq_no);
	}

	@Override
	public int updateCount(Faq faq) {
		return faqDao.updateCount(faq);
		
	}
}
