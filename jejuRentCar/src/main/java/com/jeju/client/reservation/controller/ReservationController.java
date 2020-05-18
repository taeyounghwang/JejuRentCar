package com.jeju.client.reservation.controller;



import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.client.reservation.service.ReservationService;
import com.jeju.client.reservation.vo.ReservationVO;

@Controller
@RequestMapping(value = "/Reservation")
public class ReservationController {
	private Logger log = LoggerFactory.getLogger(ReservationController.class);
	// 차량 예약 페이지
	@Autowired
	private ReservationService reservationService;

	// 차량 예약 페이지
	@RequestMapping(value = "/form", method = RequestMethod.POST)
	public String Reservationform(@ModelAttribute ReservationVO RVO, Model model) throws UnsupportedEncodingException {
		log.info("ReservationForm 호출 성공");
		log.info("CAR_number= " + RVO.getCar_model_number());
		log.info("carprice"+ RVO.getCar_price());
		
		ReservationVO reservation = new ReservationVO();
		
		reservation = reservationService.Reservation(RVO);
		
		log.info("CAR_number= " + RVO.getCar_model_number());
		
		model.addAttribute("reservation", reservation);
		return "client/reservation/ReservationForm";
		
		
	}
	
	//차량 예약 신청 완료 페이지
	@RequestMapping(value ="/ReservationResult", method =  (RequestMethod.POST))
	public String ReservationInsert(@ModelAttribute ReservationVO RVO, Model model, HttpSession session) {
		log.info("ReservationInsert 호출성공");
		log.info("날짜 인수일:",RVO.getCar_model_number());
		log.info("이용금액  :" , RVO.getCar_price());
		int result = 0;
		String url="";
		int num;
		
		ReservationVO  reservation= new ReservationVO();
		
		//insert
		result = reservationService.ReservationInsert(RVO);
		//select RSV_ NUMBER 를 추출
		num = reservationService.selectNum(RVO);
		
		System.out.println("시퀀스 = " +num);
		
		//select 추출한 RSV_NUMBER로 전체 검색
		reservation = reservationService.reservationselect(num);
		if(result == 1) {
			System.out.println("RSV"+reservation.getCar_price());
			model.addAttribute("reservation" ,reservation);
			url="client/reservation/ReservationResult";
		}else {
			model.addAttribute("code" ,1);
			url="client/reservation/form";
		}
		
		return url;
	}
	
}
