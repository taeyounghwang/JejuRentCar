package com.jeju.client.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeju.client.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Inject
	private SqlSession session;
	
	@Override
	public void insertMember(MemberVO mvo) {
		session.insert("insertMember", mvo);
	}

	@Override
	public MemberVO memberSelect(String mem_id) {
		return (MemberVO)session.selectOne("memberSelect", mem_id);
	}

}
