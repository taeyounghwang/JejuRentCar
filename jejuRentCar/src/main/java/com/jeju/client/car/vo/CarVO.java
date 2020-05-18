package com.jeju.client.car.vo;


import org.springframework.web.multipart.MultipartFile;

import com.jeju.common.vo.CommonVO;

public class CarVO extends CommonVO {
	private String car_model_number; //차량 모델 번호 고유 번호
	private String car_name; //차종명
	private String car_image; //차량 이미지
	private int car_price; //차량 가격
	private String car_fuel; //연료 옵션
	private String car_option; //차량 옵션
	private String car_insurance; //일반 보험
	private String car_adv_insurance; //고급 보험 
	private String car_stick; //차량 스틱옵션
	private MultipartFile file;		// 첨부 파일
	public String getCar_model_number() {
		return car_model_number;
	}
	public void setCar_model_number(String car_model_number) {
		this.car_model_number = car_model_number;
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
	public int getCar_price() {
		return car_price;
	}
	public void setCar_price(int car_price) {
		this.car_price = car_price;
	}
	public String getCar_fuel() {
		return car_fuel;
	}
	public void setCar_fuel(String car_fuel) {
		this.car_fuel = car_fuel;
	}
	public String getCar_option() {
		return car_option;
	}
	public void setCar_option(String car_option) {
		this.car_option = car_option;
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
	public String getCar_stick() {
		return car_stick;
	}
	public void setCar_stick(String car_stick) {
		this.car_stick = car_stick;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
}