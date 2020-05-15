package com.jeju.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.admin.login.dao.AdminLoginDao;
import com.jeju.admin.login.vo.AdminLoginVO;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Autowired
	private AdminLoginDao adminLoginDao;
	
	// 관리자 로그인 체크
	@Override
	public AdminLoginVO loginCheck(AdminLoginVO lvo) {
		AdminLoginVO vo = null;
		
		vo = adminLoginDao.loginCheck(lvo);

		return vo;
	}

}
