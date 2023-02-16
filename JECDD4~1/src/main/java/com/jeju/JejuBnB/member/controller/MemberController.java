
package com.jeju.JejuBnB.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.jeju.JejuBnB.member.model.service.MemberService;
import com.jeju.JejuBnB.member.model.vo.HostIncome;
import com.jeju.JejuBnB.member.model.vo.HostMemberRoomDetail;
import com.jeju.JejuBnB.member.model.vo.Member;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	@Autowired
	JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 로그인
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginMethod(Member member, HttpSession session, Model model) {
		logger.info("login.do user_id :   " + member.getUser_id() + "   password : " + member.getUser_pwd());
		Member loginMember = memberService.selectLogin(member);
		model.addAttribute("loginMember", loginMember);
		  if (loginMember != null &&
		  bcryptPasswordEncoder.matches(member.getUser_pwd(),
		  loginMember.getUser_pwd())) {
		  String facebookid = loginMember.getFacebook_id();
		  if (facebookid != null) {
			model.addAttribute("message", "페이스북 아이디 입니다.");
			return "common/error";
			} else {
			session.setAttribute("loginMember", loginMember);
			return "common/main";
			}
		
		  } else { model.addAttribute("message", "회원 정보와 일치하지 않습니다."); return
		  "common/error"; }
		 
	}

	// 페이스북 로그인
	@RequestMapping(value = "facebooklogin.do", method = RequestMethod.GET)
	public String facebookLoginMethod(Member member, HttpSession session, Model model,
			@RequestParam("email") String email, @RequestParam("name") String name) {
		logger.info("login.do user_id :   " + member.getUser_id() + "   password : " + member.getUser_pwd());
		member.setUser_id(email);
		Member loginMember = memberService.selectFacebookLogin(member);
		model.addAttribute("loginMember", loginMember);
		if (loginMember != null) {
			String facebookid = loginMember.getFacebook_id();
			if (facebookid != null) {
				session.setAttribute("loginMember", loginMember);
				return "common/main";
			}
			model.addAttribute("message", "페이스북 아이디가 아닙니다.");
			return "common/error";
		} else {
			model.addAttribute("email", email);
			model.addAttribute("name", name);
			return "member/facebookEnrollPage";
		}
	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
			return "common/main";
		} else {
			model.addAttribute("message", "로그인 세션이 존재하지 않습니다.");
			return "common/error";
		}
	}

	// 회원 가입
	@RequestMapping(value = "enroll.do", method = RequestMethod.POST)
	public String memberinsert(Member member, Model model) {
		logger.info("enroll : " + member);
		member.setUser_pwd(bcryptPasswordEncoder.encode(member.getUser_pwd()));
		if (memberService.insertMember(member) > 0) {
			return "common/main";
		} else {
			model.addAttribute("message", "회원 등록 실패했습니다.");
		}
		return "common/error";
	}

	// 회원 정보 수정
	@RequestMapping("mupdate.do")
	public String moveUpdateView(Member member, Model model) {
		if (memberService.updateMember(member) > 0) {
			return "redirect:/myinfo.do?user_id=" + member.getUser_id();
		} else {
			model.addAttribute("message", " 회원 정보 수정 실패 했습니다.");
			return "common/error";
		}
	}

	// 회원 비밀번호 찾고 수정
	@RequestMapping("updatepwd.do")
	public String updateSearchPwd(Member member, Model model) {
		member.setUser_pwd(bcryptPasswordEncoder.encode(member.getUser_pwd()));
		if (memberService.updatPwdMember(member) > 0) {
			return "common/main";
		} else {
			model.addAttribute("message", " 비밀번호 수정을 실패 했습니다.");
			return "common/error";
		}
	}
	// 회원 비밀번호 수정
		@RequestMapping(value="updatepwd2.do", method = RequestMethod.POST)
		public ModelAndView updatePwd(Member member, ModelAndView mv) throws IOException {
			member.setUser_pwd(bcryptPasswordEncoder.encode(member.getUser_pwd()));
			if (memberService.updatPwdMember(member) > 0) {
				mv.setViewName("member/myPage");
				return mv;
			} else {
				mv.setViewName("common/error");
				mv.addObject("message", " 비밀번호 수정을 실패 했습니다.");
				return mv;
			}
		}

	// 회원 삭제
	@RequestMapping("mdel.do")
	public String memberDeleteMethod(@RequestParam("user_id") String user_id, Model model) {
		if (memberService.deleteMember(user_id) > 0) {
			return "redirect:/logout.do";
		} else {
			model.addAttribute("message", user_id + "님 탈퇴를 실패했습니다.");
			return "common/error";
		}
	}
	// 관리자 회원 삭제
	@RequestMapping("adminDel.do")
	public String adminMemberDelete(@RequestParam("user_id") String user_id, Model model) {
		if (memberService.deleteMember(user_id) > 0) {
			return "redirect:/moveAdminMemberPage.do";
		}else {
			model.addAttribute("message", user_id + "회원의 계정탈퇴를 실패했습니다.");
			return "common/error";
		}
	}
	// 관리자 회원 등업
	@RequestMapping("beAdminMember.do")
	public String beAdminMember(@RequestParam("user_id") String user_id, Model model) {
		if (memberService.updateBeAdminMember(user_id)> 0) {
			return "redirect:/moveAdminMemberPage.do";
		}else {
			model.addAttribute("message", user_id + "님의 관리자 등업을 실패했습니다.");
			return "common/error";
		}
	}
	// 호스트 회원 등업
	@RequestMapping("beHostMember.do")
	public String beHostMember(@RequestParam("user_id") String user_id, Model model) {
		if (memberService.updateBeHostMember(user_id)> 0) {
			model.addAttribute("user_id", user_id);
			return "redirect:/hostListDetail.do";
		}else {
			model.addAttribute("message", user_id + "님의 호스트 등업을 실패했습니다.");
			return "common/error";
		}
	}
	// 호스트 일반회원으로 변경
	@RequestMapping("beNotHostMember.do")
	public String beNotHostMember(@RequestParam("user_id") String user_id, Model model) {
		if (memberService.updatebeNotHostMember(user_id)> 0) {
			model.addAttribute("user_id", user_id);
			return "redirect:/roomChangePass.do";
		}else {
			model.addAttribute("message", user_id + "님을 일반 회원으로 변경 실패했습니다.");
			return "common/error";
		}
	}
	
	// 비밀번호 확인
	@RequestMapping("memberpwdcheck.do")
	public void memberPwdCheck(Member member, Model model, HttpServletResponse response) {
		Member loginMember = memberService.selectLogin(member);
		String returnValue = null;
		if (loginMember != null && bcryptPasswordEncoder.matches(member.getUser_pwd(), loginMember.getUser_pwd())) {
			returnValue = "ok";
		}
		else {
			returnValue = "no";
		}
		response.setContentType("text/html; chatset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 회원정보확인
		@RequestMapping("infocheck.do")
		public void infoCheck(Member member, Model model, HttpServletResponse response) {
			int idcount = memberService.selectInfoCheck(member);
			String returnValue = null;
			if (idcount == 0) {
				returnValue = "no";
			} else {
				returnValue = "ok";
			}
			response.setContentType("text/html; chatset=utf-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.append(returnValue);
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	// 회원가입 이메일 인증 보내기
	@RequestMapping(value = "auth.do", method = RequestMethod.POST)
	public ModelAndView mailSending(HttpServletRequest request, @RequestParam("e_mail") String e_mail,
			HttpServletResponse response_email) throws IOException {
		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311;
		String setfrom = "8135123@gmail.com";
		String tomail = e_mail;
		String title = "회원가입 인증 이메일 입니다.";
		String content = System.getProperty("line.separator") + System.getProperty("line.separator")
				+ "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다" + System.getProperty("line.separator")
				+ System.getProperty("line.separator") + " 인증번호는 " + dice + " 입니다. "
				+ System.getProperty("line.separator") + System.getProperty("line.separator")
				+ "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/email_injeung");
		mv.addObject("dice", dice);
		mv.addObject("user_id", tomail);
		System.out.println("mv : " + mv);
		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();
		return mv;
	}

	// 회원가입 인증번호 확인
	@RequestMapping(value = "join_injeung.do", method = RequestMethod.POST)
	public ModelAndView join_injeung(@RequestParam("email_injeung") String email_injeung,
			@RequestParam("dice") String dice, @RequestParam("user_id") String user_id,
			HttpServletResponse response_equals) throws IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/join.do");
		mv.addObject("e_mail", email_injeung);
		if (email_injeung.equals(dice)) {
			mv.setViewName("member/enrollPage");
			mv.addObject("user_id", user_id);
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
			out_equals.flush();
			return mv;
		} else if (email_injeung != dice) {
			ModelAndView mv2 = new ModelAndView();
			mv2.setViewName("member/email_injeung");
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();
			return mv2;
		}
		return mv;

	}

	// 비밀번호 찾기 인증번호 보내기
	@RequestMapping(value = "sendEmail.do", method = RequestMethod.POST)
	@ResponseBody
	public String pwdmailSending(HttpServletRequest request, @RequestParam("e_mail") String e_mail,
			HttpServletResponse response) throws IOException {
		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311;
		String setfrom = "8135123@gmail.com";
		String tomail = e_mail;
		String title = "비밀번호 인증 이메일 입니다.";
		String content = System.getProperty("line.separator") + System.getProperty("line.separator")
				+ "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다" + System.getProperty("line.separator")
				+ System.getProperty("line.separator") + " 인증번호는 " + dice + " 입니다. "
				+ System.getProperty("line.separator") + System.getProperty("line.separator")
				+ "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		response.setContentType("application/json; charset=utf-8");
		JSONObject job = new JSONObject();
		job.put("no", dice);
		return job.toJSONString();
	}

	// 비밀번호 찾기 인증번호 확인
	@RequestMapping(value = "searchPwd.do", method = RequestMethod.POST)
	public ModelAndView searchPwd(@RequestParam("email_injeung") String email_injeung,
			@RequestParam("dice") String dice, @RequestParam("user_id") String user_id,
			HttpServletResponse response_equals) throws IOException {
		System.out.println("마지막 : email_injeung : " + email_injeung);
		System.out.println("마지막 : dice : " + dice);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/join.do");
		mv.addObject("e_mail", email_injeung);
		if (email_injeung.equals(dice)) {
			mv.setViewName("member/searchChangePwd");
			mv.addObject("user_id", user_id);
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경 페이지로 이동합니다.');</script>");
			out_equals.flush();
			return mv;
		} else if (email_injeung != dice) {
			ModelAndView mv2 = new ModelAndView();
			mv2.setViewName("member/searchPwdPage");
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();
			return mv2;
		}
		return mv;
	}

	/*
	 * view 이동
	 * -----------------------------------------------------------------------------
	 * ---------------------------------------
	 */
	// 호스트 매출  
		@RequestMapping("IncomeHost.do")
		public ModelAndView moveIncomeHost(ModelAndView mv, HostIncome income ) {
			ArrayList<HostIncome> list = memberService.selectIncomeHost(income);
			if(list != null) {
				mv.setViewName("member/hostIncomePage");
				mv.addObject("list", list);
			}else {
				mv.addObject("message", "숙소 결제 대기 ,결제 완료 리스트를 가져올 수 없습니다.");
				mv.setViewName("common/error");
			}
			return mv;
		}	
		
	// 호스트 신청 디테일 
	@RequestMapping("hostListDetail.do")
	public ModelAndView movehostListDetail(ModelAndView mv, HostMemberRoomDetail hostmember ) {
		ArrayList<HostMemberRoomDetail> member = memberService.selectHostListDetail(hostmember);
		if(member != null) {
			mv.setViewName("member/hostMemberRoomDetail");
			mv.addObject("hostlist", member);
		}else {
			mv.addObject("message", "회원에 대한 정보 조회 실패 했습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}	
	
	// 회원 관리 페이지
		@RequestMapping("moveAdminMemberPage.do")
		public ModelAndView moveadminMemberList(ModelAndView mv) {
			ArrayList<Member> member = memberService.selectMemberList();
			if(member != null) {
				mv.setViewName("member/adminMemberList");
				mv.addObject("memberlist", member);
			}else {
				mv.addObject("message", "관리자 정보 조회 실패 했습니다.");
				mv.setViewName("common/error");
			}
			return mv;
		}		
	
	// 회원 정보 조회 페이지
	@RequestMapping("myinfo.do")
	public ModelAndView myInfoMethod(@RequestParam("user_id") String user_id, ModelAndView mv) {
		/* String user_id = request.getParameter("user_id"); */
		Member member = memberService.selectMember(user_id);
		if (member != null) {
			mv.setViewName("member/myinfoPage");
			mv.addObject("member", member);
		} else {
			mv.addObject("message", user_id + "님  정보 조회 실패 했습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 회원정보 수정페이지
	@RequestMapping("mupview.do")
	public ModelAndView moveUpdateView(@RequestParam("user_id") String user_id, ModelAndView mv) {
		Member member = memberService.selectMember(user_id);
		if (member != null) {
			mv.addObject("member", member);
			mv.setViewName("member/memberUpdatePage");
		} else {
			mv.addObject("message", user_id + "님  수정 페이지 이동을 실패 했습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 호스트 신청 페이지 
	@RequestMapping("moveHostRequestPage.do")
	public ModelAndView moveHostRequestPage(ModelAndView mv) {
		ArrayList<Member> member = memberService.selectHostList();
		if(member != null) {
			mv.setViewName("member/hostRequestListPage");
			mv.addObject("hostlist", member);
		}else {
			mv.addObject("message", "호스트  정보 조회를 실패 했습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 회원가입 페이지
	@RequestMapping("enrollPage.do")
	public String moveEnrollPage() {
		return "member/enrollPage";
	}

	// 로그인 페이지
	@RequestMapping("loginPage.do")
	public String moveLoginPage() {
		return "member/loginPage";
	}

	// 페이스북 로그인 페이지
	@RequestMapping("facebookenrollPage.do")
	public String moveFacebookEnrollPage() {
		return "member/facebookEnrollPage";
	}

	// 이메일 인증 페이지
	@RequestMapping("email.do")
	public String email() {
		return "member/email";
	}

	// 비밀번호 찾고 변경 페이지
	@RequestMapping("searchpwdPage.do")
	public String searchPwdPage() {
		return "member/searchPwdPage";
	}
	// 비밀번호 변경 페이지
	@RequestMapping("moveUpdatePwdPage.do")
	public String moveUpdatePwdPage() {
		return "member/memberUpdatePwdPage";
	}
	// 마이 페이지 
	@RequestMapping("moveMyPage.do")
	public String moveMyPage() {
		return "member/myPage";
	}
	// 관리자 페이지
	@RequestMapping("moveAdminPage.do")
	public String moveAdminPage() {
		return "member/adminPage";
	}	

}
