package com.jeju.admin.member.reservation.vo;

import java.sql.Timestamp;

import com.jeju.admin.common.vo.CommonVO;

public class AdminMemberReservationVO extends CommonVO {
	private int rsv_number = 0; //예약번호
	private String mem_id = ""; //아이디
	private String ren_car_number = ""; //차량 번호
	private String car_name = "";//차량명
	private String rsv_name = ""; //예약자명
	private Timestamp rsv_apply_date; //예약 신청일
	private String rsv_state = ""; //예약 상태
	private int rsv_price = 0; //이용금액
	private String rsv_insu = ""; //인수예정일
	private String rsv_bannad = ""; //반납예정일
	private String rsv_cellphone = ""; //예약자 핸드폰 번호 
	private int car_model_number = 0; //차량 모델 고유번호
	private String bk_name = "";	//은행명
	private String bk_account = "";	//계좌번호
	private String bk_user = "";	//예금주
	
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
	public String getRen_car_number() {
		return ren_car_number;
	}
	public void setRen_car_number(String ren_car_number) {
		this.ren_car_number = ren_car_number;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public String getRsv_name() {
		return rsv_name;
	}
	public void setRsv_name(String rsv_name) {
		this.rsv_name = rsv_name;
	}
	public Timestamp getRsv_apply_date() {
		return rsv_apply_date;
	}
	public void setRsv_apply_date(Timestamp rsv_apply_date) {
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
	public String getRsv_cellphone() {
		return rsv_cellphone;
	}
	public void setRsv_cellphone(String rsv_cellphone) {
		this.rsv_cellphone = rsv_cellphone;
	}
	public int getCar_model_number() {
		return car_model_number;
	}
	public void setCar_model_number(int car_model_number) {
		this.car_model_number = car_model_number;
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
	
	// getter and setters
	
	

	
	
}
