package com.jeju.admin.car.list.vo;

import org.springframework.web.multipart.MultipartFile;

import com.jeju.admin.common.vo.CommonVO;

public class AdminCarListVO extends CommonVO {
	private int car_model_number = 0; // 모델 고유 번호
	private String car_name = ""; // 차량명
	private int car_price = 0; // 대여가격
	private String car_registe_date = ""; // 등록일
	private String car_image = ""; // 실제 서버에 저장한 파일명
	private String car_insurance = ""; // 일반보험
	private String car_adv_insurance = "";; // 고급보험
	private String car_stick = ""; // 스틱옵션
	private String car_fuel = ""; // 연료옵션
	private String car_number_passengers = ""; // 승차인원
	private String car_option = ""; // 차량옵션

	// 파일 업로드를 위한 속성
	private MultipartFile file;// 첨부 파일

	public int getCar_model_number() {
		return car_model_number;
	}

	public void setCar_model_number(int car_model_number) {
		this.car_model_number = car_model_number;
	}

	public String getCar_name() {
		return car_name;
	}

	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}

	public int getCar_price() {
		return car_price;
	}

	public void setCar_price(int car_price) {
		this.car_price = car_price;
	}

	public String getCar_registe_date() {
		return car_registe_date;
	}

	public void setCar_registe_date(String car_registe_date) {
		this.car_registe_date = car_registe_date;
	}

	public String getCar_image() {
		return car_image;
	}

	public void setCar_image(String car_image) {
		this.car_image = car_image;
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

	public String getCar_fuel() {
		return car_fuel;
	}

	public void setCar_fuel(String car_fuel) {
		this.car_fuel = car_fuel;
	}

	public String getCar_number_passengers() {
		return car_number_passengers;
	}

	public void setCar_number_passengers(String car_number_passengers) {
		this.car_number_passengers = car_number_passengers;
	}

	public String getCar_option() {
		return car_option;
	}

	public void setCar_option(String car_option) {
		this.car_option = car_option;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}
