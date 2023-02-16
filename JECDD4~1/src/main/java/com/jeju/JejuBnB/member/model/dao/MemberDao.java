package com.jeju.JejuBnB.member.model.dao;

import java.util.ArrayList;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.JejuBnB.member.model.vo.HostIncome;
import com.jeju.JejuBnB.member.model.vo.HostMemberRoomDetail;
import com.jeju.JejuBnB.member.model.vo.Member;
@Repository("memberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public MemberDao() {}
		
	public Member selectLogin( Member member) {
		return session.selectOne("memberMapper.loginCheck", member);
	}
	
	public int insertMember( Member member) {
		return session.insert("memberMapper.insertMember", member);
	}
	
	public Member selectMember( String user_id) {
		return session.selectOne("memberMapper.selectMember", user_id);
	}
	
	public int deleteMember(String user_id) {
		return session.delete("memberMapper.deleteMember", user_id);
	}
		
	public int updateMember( Member member) {
		return session.update("memberMapper.updateMember", member);
	}
	
	public int updateLoginok( Member member) {
		return session.update("memberMapper.updateLoginok", member);
	}
	
	public ArrayList<Member> selectSearchuser_id(String keyword) {
		List<Member> list = session.selectList("memberMapper.selectSearchuser_id", keyword);
		return (ArrayList<Member>)list;
	}
	
	public ArrayList<Member> selectSearchGender(String keyword) {
		List<Member> list = session.selectList("memberMapper.selectSearchGender", keyword);
		return (ArrayList<Member>)list;
	}
	
	public ArrayList<Member> selectSearchAge(int keyword) {
		List<Member> list = session.selectList("memberMapper.selectSearchAge", keyword);
		return (ArrayList<Member>)list;
	}
	
	public ArrayList<Member> selectSearchLoginok(String keyword) {
		List<Member> list = session.selectList("memberMapper.selectSearchLoginok", keyword);
		return (ArrayList<Member>)list;
	}
	
	public int selectCheckId(String user_id) {
		return session.update("memberMapper.selectCheckId", user_id);
	}
	
	public Member selectFacebookLogin(Member member) {
		return session.selectOne("memberMapper.facebookLoginCheck", member);
	}
	
	
	public int selectIdCheck(String user_id) {
		return session.selectOne("memberMapper.selectIdCheck", user_id);
	}
	
	public int selectInfoCheck(Member member) {
		return session.selectOne("memberMapper.selectInfoCheck", member);
	}
	
	public int updatePwdMember(Member member) {
		return session.update("memberMapper.updatePwdMember", member);
	}
	
	public ArrayList<Member> selectMemberList() {
		List<Member> list = session.selectList("memberMapper.selectMemberList");
		return (ArrayList<Member>)list;
	}
	
	public int updateBeAdminMember(String user_id) {
		return session.update("memberMapper.updateBeAdminMember", user_id);
	}
	
	public ArrayList<Member> selectHostList() {
		List<Member> list = session.selectList("memberMapper.selectHostList");
		return (ArrayList<Member>)list;
	}
	
	public ArrayList<HostMemberRoomDetail> selectHostListDetail(HostMemberRoomDetail hostmember) {
		List<HostMemberRoomDetail> list = session.selectList("memberMapper.selectHostListDetail", hostmember);
		return (ArrayList<HostMemberRoomDetail>)list;
	}
	
	public int updateBeHostMember(String user_id) {
		return session.update("memberMapper.updateBeHostMember", user_id);
	}
	
	public int updatebeNotHostMember(String user_id) {
		return session.update("memberMapper.updatebeNotHostMember", user_id);
	}

	public ArrayList<HostIncome> selectIncomeHost(HostIncome income) {
		List<HostIncome> list = session.selectList("memberMapper.selectIncomeHost", income);
		return (ArrayList<HostIncome>)list;
	}


}


