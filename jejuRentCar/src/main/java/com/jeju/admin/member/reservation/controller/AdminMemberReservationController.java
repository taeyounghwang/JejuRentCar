package com.jeju.admin.member.reservation.controller;

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

import com.jeju.admin.common.util.Util;
import com.jeju.admin.member.reservation.service.AdminMemberReservationService;
import com.jeju.admin.member.reservation.vo.AdminMemberReservationVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminMemberReservationController {
	private Logger log = LoggerFactory.getLogger(AdminMemberReservationController.class);

	@Autowired
	private AdminMemberReservationService adminMemberReservationService;

	// 1.회원 예약 리스트
	@RequestMapping(value = "/memreservation/memRes", method = RequestMethod.GET)
	public ModelAndView memResList(@ModelAttribute AdminMemberReservationVO vo, HttpSession session) throws Exception {

		// 정렬 사용 시 강제 주입 필요
		vo.setOrder_by("rsv_number");
		// vo.setOrder_sc("rsv_number");

		log.info("admin memRes 호출 성공");

		// 전체 레코드수 구현
		int total = adminMemberReservationService.memResListCnt(vo);
		log.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(vo.getPage()) - 1) * Util.nvl(vo.getPageSize());
		log.info("count = " + count);

		ModelAndView mav = new ModelAndView();
		ModelAndView login = new ModelAndView();

		List<AdminMemberReservationVO> memList = adminMemberReservationService.memResList(vo);

		if (session.getAttribute("AdminLogin") == null) {
			login.setViewName("redirect:/admin");
			return login;
		} else {
			mav.addObject("memResList", memList);
			mav.addObject("count", count);
			mav.addObject("total", total);
			mav.addObject("data", vo);
			mav.setViewName("admin/memreservation/adminMemReservation");
			return mav;
		}
	}

	// 2.회원 예약 상세 내역
	@RequestMapping(value = "/memreservation/adminMemReservationDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam int rsv_number, HttpSession session) throws Exception {
		log.info("admin Detail 호출 성공");
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("admin/memreservation/adminMemReservationDetail");
		// 뷰에 전달할 데이터
		mav.addObject("vo", adminMemberReservationService.detail(rsv_number));
		return mav;
	}

	// 3.회원 상태 변경 and 렌트 테이블에 저장
	@RequestMapping(value = "/memreservation/adminMemReservationUpdate", method = RequestMethod.POST)
	public String update(@ModelAttribute AdminMemberReservationVO vo) throws Exception {
		log.info("update 호출 성공");

		System.out.println(vo.getRsv_number());
		int result = 0;
		String url = "";

		result = adminMemberReservationService.update(vo);

		if (result == 1) {
			adminMemberReservationService.insert(vo);
			url = "/admin/carres/carRes";

		} else {
			url = "/admin/memreservation/adminMemReservationDetail?rsv_number = " + vo.getRsv_number();
		}

		return "redirect:" + url;
	}

	// 월별 매출 통계
	@RequestMapping(value = "/memreservation/stat")
	public ModelAndView stat(AdminMemberReservationVO rvo) {

		// 1월달 매출액,예약건수
		AdminMemberReservationVO rvo1 = new AdminMemberReservationVO();
		rvo1 = adminMemberReservationService.selectJan(rvo);
		int price1 = rvo1.getRsv_price();
		int total1 = adminMemberReservationService.selectJanCnt(rvo);
		
		// 2월달 매출액,예약건수
		AdminMemberReservationVO rvo2 = new AdminMemberReservationVO();
		rvo2 = adminMemberReservationService.selectFeb(rvo);
		int price2 = rvo2.getRsv_price();
		int total2 = adminMemberReservationService.selectFebCnt(rvo);
		
		// 3월달 매출액,예약건수
		AdminMemberReservationVO rvo3 = new AdminMemberReservationVO();
		rvo3 = adminMemberReservationService.selectMar(rvo);
		int price3 = rvo3.getRsv_price();
		int total3 = adminMemberReservationService.selectMarCnt(rvo);
		
		// 4월달 매출액,예약건수
		AdminMemberReservationVO rvo4 = new AdminMemberReservationVO();
		rvo3 = adminMemberReservationService.selectApr(rvo);
		int price4 = rvo4.getRsv_price();
		int total4 = adminMemberReservationService.selectAprCnt(rvo);
		
		// 5월달 매출액,예약건수
		AdminMemberReservationVO rvo5 = new AdminMemberReservationVO();
		rvo5 = adminMemberReservationService.selectMay(rvo);
		int price5 = rvo5.getRsv_price();
		int total5 = adminMemberReservationService.selectMayCnt(rvo);
		
		// 6월달 매출액,예약건수
		AdminMemberReservationVO rvo6 = new AdminMemberReservationVO();
		rvo6 = adminMemberReservationService.selectJun(rvo);
		int price6 = rvo6.getRsv_price();
		int total6 = adminMemberReservationService.selectJunCnt(rvo);
		
		// 7월달 매출액,예약건수
		AdminMemberReservationVO rvo7 = new AdminMemberReservationVO();
		rvo7 = adminMemberReservationService.selectJul(rvo);
		int price7 = rvo7.getRsv_price();
		int total7 = adminMemberReservationService.selectJulCnt(rvo);
		
		// 8월달 매출액,예약건수
		AdminMemberReservationVO rvo8 = new AdminMemberReservationVO();
		rvo6 = adminMemberReservationService.selectAug(rvo);
		int price8 = rvo8.getRsv_price();
		int total8 = adminMemberReservationService.selectAugCnt(rvo);
		
		// 9월달 매출액,예약건수
		AdminMemberReservationVO rvo9 = new AdminMemberReservationVO();
		rvo6 = adminMemberReservationService.selectSept(rvo);
		int price9 = rvo9.getRsv_price();
		int total9 = adminMemberReservationService.selectSeptCnt(rvo);
		
		// 10월달 매출액,예약건수
		AdminMemberReservationVO rvo10 = new AdminMemberReservationVO();
		rvo6 = adminMemberReservationService.selectOct(rvo);
		int price10 = rvo10.getRsv_price();
		int total10 = adminMemberReservationService.selectOctCnt(rvo);
		
		// 11월달 매출액,예약건수
		AdminMemberReservationVO rvo11 = new AdminMemberReservationVO();
		rvo6 = adminMemberReservationService.selectNov(rvo);
		int price11 = rvo11.getRsv_price();
		int total11 = adminMemberReservationService.selectNovCnt(rvo);
		
		// 12월달 매출액,예약건수
		AdminMemberReservationVO rvo12 = new AdminMemberReservationVO();
		rvo6 = adminMemberReservationService.selectDec(rvo);
		int price12 = rvo12.getRsv_price();
		int total12 = adminMemberReservationService.selectDecCnt(rvo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("price1", price1);// 1월 매출액
		mav.addObject("total1", total1);// 1월 예약건수
		
		mav.addObject("price2", price2);// 2월 매출액
		mav.addObject("total2", total2);// 2월 예약건수
		
		mav.addObject("price3", price3);// 3월 매출액
		mav.addObject("total3", total3);// 3월 예약건수
		
		mav.addObject("price4", price4);
		mav.addObject("total4", total4);
		
		mav.addObject("price5", price5);
		mav.addObject("total5", total5);
		
		mav.addObject("price6", price6);
		mav.addObject("total6", total6);
		
		mav.addObject("price7", price7);
		mav.addObject("total7", total7);
		
		mav.addObject("price8", price8);
		mav.addObject("total8", total8);
		
		mav.addObject("price9", price9);
		mav.addObject("total9", total9);
		
		mav.addObject("price10", price10);
		mav.addObject("total10", total10);
		
		mav.addObject("price11", price11);
		mav.addObject("total11", total11);
		
		mav.addObject("price12", price12);
		mav.addObject("total12", total12);
		mav.setViewName("admin/memreservation/adminStat");
		return mav;

	}

}
