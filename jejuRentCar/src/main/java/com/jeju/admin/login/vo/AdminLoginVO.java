package com.jeju.admin.login.vo;

public class AdminLoginVO {
	String admin_id = ""; // 관리자 아이디
	String admin_pw = ""; // 관리자 비밀번호

	public AdminLoginVO() {
		super();
	}

	public AdminLoginVO(String admin_id, String admin_pw) {
		super();
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}

}
