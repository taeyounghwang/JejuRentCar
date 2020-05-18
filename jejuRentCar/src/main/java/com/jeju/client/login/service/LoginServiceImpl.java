package com.jeju.client.login.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.client.common.util.BCrypt;
import com.jeju.client.common.util.SHA256;
import com.jeju.client.login.dao.LoginDao;
import com.jeju.client.login.vo.LoginVO;
import com.jeju.client.member.vo.MemberVO;
import com.jeju.client.notice.vo.NoticeVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao logindao;

	@Override
	// 로그인 구현
	public LoginVO loginSelect(LoginVO lvo) {
		SHA256 sha = SHA256.getInsatnce();

		String passwd = lvo.getMem_password();

		String shaPass = null;
		try {
			shaPass = sha.getSha256(passwd.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		String dbPass = selectHash(lvo.getMem_id());
		if (dbPass != null) { // 셀렉트 해쉬가 널이 아닐경우
			if (BCrypt.checkpw(shaPass, dbPass)) {
				System.out.println("비밀번호 일치");
				lvo.setMem_password(dbPass);
			} else {
				System.out.println("비밀번호 불일치"); // 비밀번호 틀릴경우
			}
		}

		return logindao.loginSelect(lvo);
	}

	@Override
	// 아이디 중복 확인 구현
	public String selectHash(String mem_id) {
		return logindao.selectHash(mem_id);
	}

	@Override
	// 아이디 찾기 구현
	public List<NoticeVO> userIdfind(MemberVO mvo) {
		return logindao.idSelect(mvo);
	}

	@Override
	// 비멀번호 찾기 구현
	public int updatePw(MemberVO mvo) throws Exception {
		
		SHA256 sha = SHA256.getInsatnce();
		
		String orgPasswd = mvo.getMem_password();
		
		String shaPass = sha.getSha256(orgPasswd.getBytes());
		
		String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
		
		mvo.setMem_password(bcPass);
		
		return logindao.updatePw(mvo);
	}
	
	
	// 비밀번호 찾기 구현시 비밀번호 셀렉트
	@Override
	public MemberVO pwSearch(MemberVO mvo) {
		return logindao.pwSelect(mvo);
	}

}
