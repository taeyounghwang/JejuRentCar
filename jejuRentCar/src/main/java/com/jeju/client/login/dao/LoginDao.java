package com.jeju.client.login.dao;

import java.util.List;

import com.jeju.client.login.vo.LoginVO;
import com.jeju.client.member.vo.MemberVO;
import com.jeju.client.notice.vo.NoticeVO;

public interface LoginDao {

	public LoginVO loginSelect(LoginVO lvo);
	public String selectHash(String mem_id);
	public List<NoticeVO> idSelect(MemberVO mvo);
	public int updatePw(MemberVO mvo)throws Exception;
	public MemberVO pwSelect(MemberVO mvo);
}