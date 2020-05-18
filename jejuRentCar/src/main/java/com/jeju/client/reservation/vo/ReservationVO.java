package com.jeju.client.reservation.vo;


public class ReservationVO {
	private int rsv_number; // 예약번호
	private String mem_id =""; // 아이디
	private String car_model_number; // 차량번호
	private String rsv_name=""; // 예약자 명
	private String rsv_cellphone="";//예약자 핸드폰번호
	private String rsv_apply_date=""; // 예약 신청일 
	private String rsv_state=""; // 예약 상태
	private int rsv_price=0; // 이용 금액
	private String rsv_insu =""; // 인수일
	private String rsv_bannad=""; //반납
	private String car_name=""; // 차종명
	private String car_image=""; // 차량 이미지
	private String car_fuel=""; //연료 옵션
	private int car_price=0; //차량 가격
	private String car_insurance=""; //일반 보험
	private String car_adv_insurance=""; //고급 보험 
	private String bk_name="";
	private String bk_account="";
	private String bk_user="";
	
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
	public String getRsv_cellphone() {
		return rsv_cellphone;
	}
	public void setRsv_cellphone(String rsv_cellphone) {
		this.rsv_cellphone = rsv_cellphone;
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
	public int getRsv_price() {
		return rsv_price;
	}
	public void setRsv_price(int rsv_price) {
		this.rsv_price = rsv_price;
	}
	public String getRsv_insu() {
		return rsv_insu;
	}
	public void setRsv_insu(String rsv_insu) {
		this.rsv_insu = rsv_insu;
	}
	public String getRsv_bannad() {
		return rsv_bannad;
	}
	public void setRsv_bannad(String rsv_bannad) {
		this.rsv_bannad = rsv_bannad;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public String getCar_image() {
		return car_image;
	}
	public void setCar_image(String car_image) {
		this.car_image = car_image;
	}
	public String getCar_fuel() {
		return car_fuel;
	}
	public void setCar_fuel(String car_fuel) {
		this.car_fuel = car_fuel;
	}
	public int getCar_price() {
		return car_price;
	}
	public void setCar_price(int car_price) {
		this.car_price = car_price;
	}
	public String getCar_insurance() {
		return car_insurance;
	}
	public void setCar_insurance(String car_insurance) {
		this.car_insurance = car_insurance;
	}
	public String getCar_adv_insurance() {
		return car_adv_insurance;
	}
	public void setCar_adv_insurance(String car_adv_insurance) {
		this.car_adv_insurance = car_adv_insurance;
	}
	public String getBk_name() {
		return bk_name;
	}
	public void setBk_name(String bk_name) {
		this.bk_name = bk_name;
	}
	public String getBk_account() {
		return bk_account;
	}
	public void setBk_account(String bk_account) {
		this.bk_account = bk_account;
	}
	public String getBk_user() {
		return bk_user;
	}
	public void setBk_user(String bk_user) {
		this.bk_user = bk_user;
	}
	
	
	
}