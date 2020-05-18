package com.jeju.client.member.dao;

import com.jeju.client.member.vo.MemberVO;

public interface MemberDao {
	public void insertMember(MemberVO mvo);
	public MemberVO memberSelect(String mem_id);
	
}
