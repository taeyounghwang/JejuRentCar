package com.jeju.admin.login.service;

import com.jeju.admin.login.vo.AdminLoginVO;

public interface AdminLoginService {

	// 관리자 로그인 체크
	public AdminLoginVO loginCheck(AdminLoginVO lvo);
	
}
