package com.jeju.admin.member.list.vo;


import com.jeju.admin.common.vo.CommonVO;

public class AdminMemberListVO extends CommonVO {
	private String mem_id = ""; // 회원 아이디
	private String mem_name = ""; // 회원명
	private String mem_gender = ""; // 성별
	private String mem_birthday; // 생년월일
	private String mem_cellphone = ""; // 핸드폰번호
	private String mem_state = ""; // 회원상태
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_birthday() {
		return mem_birthday;
	}
	public void setMem_birthday(String mem_birthday) {
		this.mem_birthday = mem_birthday;
	}
	public String getMem_cellphone() {
		return mem_cellphone;
	}
	public void setMem_cellphone(String mem_cellphone) {
		this.mem_cellphone = mem_cellphone;
	}
	public String getMem_state() {
		return mem_state;
	}
	public void setMem_state(String mem_state) {
		this.mem_state = mem_state;
	}

	

}