package com.jeju.JejuBnB.question.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.question.model.service.QuestionService;
import com.jeju.JejuBnB.question.model.vo.Question;
import com.jeju.JejuBnB.question.model.vo.Question_Type;

@Controller
public class QuestionController {
	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	JavaMailSender mailSender;
	
	@RequestMapping(value="questionListView.do")
	public ModelAndView selectList(ModelAndView mv){
		ArrayList<Question_Type> question = questionService.allList();
		
		if(question != null) {
			mv.setViewName("question/questionListView");
			mv.addObject("question", question);
		}else {
			mv.addObject("message", "조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="questionAdminListView.do")
	public ModelAndView adminList(ModelAndView mv){
		ArrayList<Question_Type> question = questionService.allList();
		
		if(question != null) {
			mv.setViewName("question/questionAdminListView");
			mv.addObject("question", question);
		}else {
			mv.addObject("message", "조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="questionAdminAnswer.do")
	public ModelAndView adminAnswer(ModelAndView mv){
		ArrayList<Question_Type> question = questionService.allList();
		
		if(question != null) {
			mv.setViewName("question/questionAdminAnswer");
			mv.addObject("question", question);
		}else {
			mv.addObject("message", "조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="qTypeChange.do", method=RequestMethod.POST)
	@ResponseBody
	public String qTypeChange(Model model, @RequestParam("qtype") String qtype) {
		ArrayList<Question_Type> qlist = questionService.selectType(Integer.parseInt(qtype));
		logger.info(qlist.toString() + qlist.size());
		JSONObject sendjob = new JSONObject();
		
		JSONArray jrr = new JSONArray();
		if(qlist.size() > 0) {	
			
			
			for(int i = 0; i < qlist.size(); i++) {
				JSONObject job = new JSONObject();
				job.put("question_no", qlist.get(i).getQuestion_no());
				job.put("user_id", URLEncoder.encode(qlist.get(i).getUser_id()));
				job.put("question_title",  URLEncoder.encode(qlist.get(i).getQuestion_title()));
				/*
				 * job.put("question_rcontent", qlist.get(i).getQuestion_rcontent());
				 * job.put("questiontype_no", qlist.get(i).getQuestiontype_no());
				 */
				job.put("questiontype_name", URLEncoder.encode(qlist.get(i).getQuestiontype_name()));
				
				
				jrr.add(job);
			}			
			
			logger.info(jrr.toString());
			sendjob.put("qlist", jrr);
			
		}
	
		return sendjob.toJSONString();
	}
		
	
	@RequestMapping("questionInsertView.do")
	public ModelAndView moveInsertQuestion(ModelAndView mv) {
		ArrayList<Question> question = questionService.selectList();
		
		if(question != null) {
			mv.setViewName("question/questionAdd");
			mv.addObject("question", question);
		}else {
			mv.addObject("message", "조회 실패");
			mv.setViewName("common/error");
		}
		return mv;

	}
	
	@RequestMapping("adminDetailView.do")
	public ModelAndView moveAdminDetail(ModelAndView mv,@RequestParam("question_no")int question_no) {
		Question question = questionService.selectDetail(question_no);
		if(question != null) {
			mv.setViewName("question/questionAdminDetailView");
			mv.addObject("question", question);
		}else {
			mv.setViewName("common/error");
			mv.addObject("message", "조회실패");
		}
		return mv;		
	}
	
	@RequestMapping("questionDetailView.do")
	public ModelAndView moveDetailQuestion(ModelAndView mv,@RequestParam("question_no")int question_no) {
		Question question = questionService.selectDetail(question_no);
		if(question != null) {
			mv.setViewName("question/questionDetailView");
			mv.addObject("question", question);
		}else {
			mv.setViewName("common/error");
			mv.addObject("message", "조회실패");
		}
		return mv;		
	}
	
	@RequestMapping(value="updateAdmin.do", method=RequestMethod.POST)
	public String updateQuestion(Question question,Model model) {
		int result = questionService.updateQuestion(question);
		if(result > 0) {
			model.addAttribute("question", question);
			return "redirect:questionAdminListView.do";					
		}else {
			model.addAttribute("message", "답변 실패");
			return "common/error";
		}
	}
	
	
	@RequestMapping(value="myQuestionAdd.do", method=RequestMethod.POST)
	public String insertMyQuestion(Question question, Model model,MultipartHttpServletRequest mrequest,
			HttpServletRequest request,@RequestParam(value="qfile")MultipartFile qfile){
		/*
		 * ,
			@RequestParam("e_mail") String e_mail, HttpServletResponse response_email) throws IOException 
		 * 
		 * question.setUser_id(e_mail); //questionService.insert 문 만들기 String setfrom =
		 * "8135123@gmail.com"; String tomail = e_mail; String title = "1대1 문의 내용입니다.";
		 * String content = System.getProperty("line.separator") +
		 * System.getProperty("line.separator") + "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다" +
		 * System.getProperty("line.separator") + System.getProperty("line.separator") +
		 * " 1대1 문의 내용은 " + question.getQuestion_content() + " 입니다. " +
		 * System.getProperty("line.separator") + System.getProperty("line.separator") +
		 * "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; try { MimeMessage message =
		 * mailSender.createMimeMessage(); MimeMessageHelper messageHelper = new
		 * MimeMessageHelper(message, true, "UTF-8"); messageHelper.setFrom(setfrom);
		 * messageHelper.setTo(tomail); messageHelper.setSubject(title);
		 * messageHelper.setText(content); mailSender.send(message); } catch (Exception
		 * e) { System.out.println(e); } ModelAndView mv = new ModelAndView();
		 * mv.setViewName("question/만들고 싶은 페이지 ");
		 * response_email.setContentType("text/html; charset=UTF-8"); PrintWriter
		 * out_email = response_email.getWriter(); out_email.
		 * println("<script>alert('이메일이 발송되었습니다. 1대1 문의 내용은 이메일에서도 확인 가능합니다.');</script>"
		 * ); out_email.flush();
		 */
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		int result = 0;
		if(qfile.getOriginalFilename().length() > 0) {
			String orgname = qfile.getOriginalFilename();
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/questionimg");
			question.setQuestion_fimg(qfile.getOriginalFilename());
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			rename += "." + qfile.getOriginalFilename().substring(qfile.getOriginalFilename().lastIndexOf(".") + 1);
			
			try {
				qfile.transferTo(new File(savePath + "\\" + rename));
			}catch(IllegalStateException | IOException e){
				e.printStackTrace();
			}
			question.setQuestion_fimg(qfile.getOriginalFilename());
			question.setQuestion_rimg(rename);
			System.out.println("not null "+ question.getQuestion_rimg());
			result = questionService.insertMyQuestion(question);
		}else {
			question.setQuestion_fimg(null);
			question.setQuestion_rimg(null);
			System.out.println("null "+ question.getQuestion_rimg());
			result = questionService.insertMyQuestion(question);
		}
		if(result > 0) {
				return "redirect:questionListView.do";
			}else {
				model.addAttribute("message", question + "이벤트 등록 실패");
				return "common/error";
	}
	}
}
