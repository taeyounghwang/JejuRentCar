package com.jeju.admin.car.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.admin.car.reservation.service.AdminCarReservationService;
import com.jeju.admin.car.reservation.vo.AdminCarReservationVO;
import com.jeju.admin.common.util.Util;

@Controller
@RequestMapping(value = "/admin")
public class AdminCarReservationController {
	private Logger log = LoggerFactory.getLogger(AdminCarReservationController.class);

	@Autowired
	private AdminCarReservationService adminCarReservationService;
	
	//1.차량 예약 리스트
	@RequestMapping(value="/carres/carRes", method = RequestMethod.GET)
	public ModelAndView carResList(@ModelAttribute AdminCarReservationVO vo, HttpSession session) throws Exception {
		
		log.info("admin adminCarReservation 호출 성공");
		
		vo.setOrder_by("ren_number");
		
		// 전체 레코드수 구현
		int total = adminCarReservationService.listCnt(vo);
		log.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(vo.getPage()) - 1) * Util.nvl(vo.getPageSize());
		log.info("count = " + count);
		
		List<AdminCarReservationVO> carRList = adminCarReservationService.carResList(vo);
		
		ModelAndView mav = new ModelAndView();
		ModelAndView login = new ModelAndView();
		
		if (session.getAttribute("AdminLogin") == null) {
			login.setViewName("redirect:/admin");
			return login;
		} else {
			mav.addObject("carResList", carRList);
			mav.addObject("total", total);
			mav.addObject("count", count);
			mav.addObject("data", vo);
			mav.setViewName("admin/carreservation/adminCarReservation");
			return mav;
		}
			
	}
	
	//2.차량 예약 상세 내역
	@RequestMapping(value="/carres/carResDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam int ren_number, HttpSession session) throws Exception {
		log.info("admin Detail 호출 성공");
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("admin/carreservation/adminCarReservationDetail");
		// 뷰에 전달할 데이터
		mav.addObject("vo", adminCarReservationService.detail(ren_number));
		return mav;
	}
	
	//3.회원 상태 변경 and 렌트 테이블에 저장
	@RequestMapping(value = "/carres/adminCarReservationUpdate", method = RequestMethod.POST)
	public String update(@ModelAttribute AdminCarReservationVO vo) throws Exception {
		log.info("update 호출 성공");
			
		System.out.println(vo.getRen_number());
		
		int result = 0;
		String url = "";
			
		result = adminCarReservationService.update(vo);
		System.out.println(result);
		
		if (result == 1) {
			adminCarReservationService.change(vo);
			System.out.println(vo.getRsv_number());
			url = "/admin/carres/carRes";
		} else {
			url = "/admin/carreservation/adminCarReservationDetail?rsv_number = " + vo.getRen_number();
		}
		return "redirect:" + url;
		}
}
