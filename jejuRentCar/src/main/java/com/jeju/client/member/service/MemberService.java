package com.jeju.client.member.service;

import com.jeju.client.member.vo.MemberVO;

public interface MemberService {
	public void insertMember(MemberVO mvo) throws Exception;
	public int userIdConfirm(String mem_id);
}
