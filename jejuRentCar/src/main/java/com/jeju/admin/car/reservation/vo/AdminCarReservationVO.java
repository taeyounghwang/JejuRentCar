package com.jeju.admin.car.reservation.vo;

import com.jeju.admin.common.vo.CommonVO;

public class AdminCarReservationVO extends CommonVO{
	private int ren_number = 0; //대여번호
	private int rsv_number = 0; //예약번호
	private String mem_id = "";	//회원 아이디
	private String rsv_insu = "";	//인수 예상 날짜
	private String rsv_bannad = "";	//반납 예상 날짜
	private String rsv_state = "";	//예약 상태
	private String car_name = "";	//차량 명
	private String rsv_name = "";	//예약자명
	private String rsv_cellphone = "";	//예약자 핸드폰 번호
	private String ren_take_date = "";	//실 대여 일
	private String ren_return_date = "";	//실 반납 일
	private String ren_license_number = "";	//운전면허증
	private String ren_car_number = "";	// 대여번호
	private int car_model_number = 0;	//모델 고유 번호
	
	public int getRen_number() {
		return ren_number;
	}
	public void setRen_number(int ren_number) {
		this.ren_number = ren_number;
	}
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
	public String getRsv_state() {
		return rsv_state;
	}
	public void setRsv_state(String rsv_state) {
		this.rsv_state = rsv_state;
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
	public String getRsv_cellphone() {
		return rsv_cellphone;
	}
	public void setRsv_cellphone(String rsv_cellphone) {
		this.rsv_cellphone = rsv_cellphone;
	}
	public String getRen_take_date() {
		return ren_take_date;
	}
	public void setRen_take_date(String ren_take_date) {
		this.ren_take_date = ren_take_date;
	}
	public String getRen_return_date() {
		return ren_return_date;
	}
	public void setRen_return_date(String ren_return_date) {
		this.ren_return_date = ren_return_date;
	}
	public String getRen_license_number() {
		return ren_license_number;
	}
	public void setRen_license_number(String ren_license_number) {
		this.ren_license_number = ren_license_number;
	}
	public String getRen_car_number() {
		return ren_car_number;
	}
	public void setRen_car_number(String ren_car_number) {
		this.ren_car_number = ren_car_number;
	}
	public int getCar_model_number() {
		return car_model_number;
	}
	public void setCar_model_number(int car_model_number) {
		this.car_model_number = car_model_number;
	}
	
	
}
