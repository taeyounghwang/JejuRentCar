package com.jeju.admin.login.dao;

import com.jeju.admin.login.vo.AdminLoginVO;

public interface AdminLoginDao {

	// 관리자 로그인 체크
	public AdminLoginVO loginCheck(AdminLoginVO lvo);

}
