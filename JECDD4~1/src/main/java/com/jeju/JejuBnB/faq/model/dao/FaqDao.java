package com.jeju.JejuBnB.faq.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.faq.model.vo.Faq;
import com.jeju.JejuBnB.faq.model.vo.FaqPlus;

@Repository("faqDao")
public class FaqDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public FaqDao() {}
	
	public ArrayList<FaqPlus> selectList() {
		List<FaqPlus> list = session.selectList("faqMapper.selectList");
		return (ArrayList<FaqPlus>)list;
	}
	
	public int InsertFaq(Faq faq) {
		return session.insert("faqMapper.insertFaq", faq);
	}
	
	public ArrayList<FaqPlus> top7List(){
		List<FaqPlus> list = session.selectList("faqMapper.Top7List");
		return (ArrayList<FaqPlus>)list;
	}
	
	public int deleteFaq(String faq_no) {
		String [] faqNo = faq_no.split(",");
		int result = 0;
		for(int i = 0; i < faqNo.length; i++) {
			int count = session.delete("faqMapper.deleteFaq", faqNo[i]);
			if(count > 0) {
				result++;
			}
		}
		if(result == faqNo.length) {
			return 1;
		}else {
			return 0;
		}
	}

	public int updateCount(Faq faq) {
		return session.update("faqMapper.updateCount", faq);
	}
}
