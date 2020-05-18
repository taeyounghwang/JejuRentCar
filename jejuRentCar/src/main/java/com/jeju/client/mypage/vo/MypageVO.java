package com.jeju.client.mypage.vo;


public class MypageVO {
	
	private int rsv_number;					//예약번호(PK)
	private String mem_id = "";				//아이디(FK)
	private String car_model_number = "";	//차량모델 고유번호(FK)
	private String rsv_name = "";			//예약자 명
	private String rsv_apply_date = "";		//예약 신청일
	private String rsv_state = "";			//예약 상태
	private String rsv_price = "";			//이용 금액
	private String rsv_expected_date = "";	//대여 예상 일시
	private String rsv_amount = "";			//수량
	
	public int getRsv_number() {
		return rsv_number;
	}
	public void setRsv_number(int rsv_number) {
		this.rsv_number = rsv_number;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getCar_model_number() {
		return car_model_number;
	}
	public void setCar_model_number(String car_model_number) {
		this.car_model_number = car_model_number;
	}
	public String getRsv_name() {
		return rsv_name;
	}
	public void setRsv_name(String rsv_name) {
		this.rsv_name = rsv_name;
	}
	public String getRsv_apply_date() {
		return rsv_apply_date;
	}
	public void setRsv_apply_date(String rsv_apply_date) {
		this.rsv_apply_date = rsv_apply_date;
	}
	public String getRsv_state() {
		return rsv_state;
	}
	public void setRsv_state(String rsv_state) {
		this.rsv_state = rsv_state;
	}
	public String getRsv_price() {
		return rsv_price;
	}
	public void setRsv_price(String rsv_price) {
		this.rsv_price = rsv_price;
	}
	public String getRsv_expected_date() {
		return rsv_expected_date;
	}
	public void setRsv_expected_date(String rsv_expected_date) {
		this.rsv_expected_date = rsv_expected_date;
	}
	public String getRsv_amount() {
		return rsv_amount;
	}
	public void setRsv_amount(String rsv_amount) {
		this.rsv_amount = rsv_amount;
	}
	
	
}
