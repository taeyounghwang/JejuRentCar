package com.jeju.client.login.service;

import java.util.List;

import com.jeju.client.login.vo.LoginVO;
import com.jeju.client.member.vo.MemberVO;
import com.jeju.client.notice.vo.NoticeVO;

public interface LoginService {
	public LoginVO loginSelect(LoginVO lvo) throws Exception;
	public String selectHash(String mem_id);
	public List<NoticeVO> userIdfind(MemberVO mvo);
	public int updatePw(MemberVO mvo) throws Exception;
	public MemberVO pwSearch(MemberVO mvo);
}
