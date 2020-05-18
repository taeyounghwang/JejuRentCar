package com.jeju.client.refund.vo;

import java.sql.Timestamp;

import com.jeju.admin.common.vo.CommonVO;



public class RefundVO extends CommonVO{
	
	//환불 관리 리스트
	private int ref_number = 0; //환불번호
	private int rsv_number = 0; //예약번호
	private String mem_id = ""; //아이디
	private String car_name = ""; //차량명
	private String rsv_name = ""; //예약자명
	private Timestamp rsv_apply_date; //예약 신청일
	private String rsv_state = ""; //환불 상태
	private int rsv_price = 0; //이용금액
	private String rsv_insu; //대여 예상 일
	private String rsv_bannad;
	private String bk_name = ""; //은행명
	private String bk_account = "";//계좌번호
	private String bk_user = ""; //예금주
	
	public int getRef_number() {
		return ref_number;
	}
	public void setRef_number(int ref_number) {
		this.ref_number = ref_number;
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
