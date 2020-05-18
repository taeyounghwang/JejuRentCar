package com.jeju.client.login.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.jeju.client.login.vo.LoginVO;
import com.jeju.client.member.vo.MemberVO;
import com.jeju.client.notice.vo.NoticeVO;

public class LoginDaoImpl implements LoginDao {

	@Inject
	private SqlSession session;

	// 로그인 구현
	@Override
	public LoginVO loginSelect(LoginVO lvo) {
		return session.selectOne("loginSelect", lvo);
	}

	// 아이디 중복확인 구현
	@Override
	public String selectHash(String mem_id) {
		return session.selectOne("selectHash", mem_id);
	}

	// 아이디 찾기 구현
	@Override
	public List<NoticeVO> idSelect(MemberVO mvo) {
		return session.selectList("idSelect", mvo);
	}

	
	// 비밀번호 찾기 구현
	@Override
	public int updatePw(MemberVO mvo) throws Exception {
		return session.update("updatePw", mvo);
	}

	// 임시 비밀 번호 발송시 비밀번호 셀렉트
	@Override
	public MemberVO pwSelect(MemberVO mvo) {
		return session.selectOne("pwSelect", mvo);
	}

}