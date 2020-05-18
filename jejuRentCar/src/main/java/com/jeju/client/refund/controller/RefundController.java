package com.jeju.client.refund.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.admin.member.reservation.vo.AdminMemberReservationVO;
import com.jeju.client.refund.service.RefundService;
import com.jeju.client.refund.vo.RefundVO;
import com.jeju.client.reservation.vo.ReservationVO;

@Controller
@RequestMapping("/refund")
public class RefundController {

	private Logger log = LoggerFactory.getLogger(RefundController.class);

	@Inject
	private RefundService refundService;

	

	// 예약 취소
	@ResponseBody
	@RequestMapping(value = "/rescancel", method = RequestMethod.POST)
	public int rescancel(@ModelAttribute ReservationVO rvo) {
		log.info("예약취소 메서드 호출성공");


		int result = 0;
		if (rvo.getRsv_state().equals("입금대기")) {
			result = refundService.rescancel(rvo);

		} else {
			result = 2;

		}
		return result;
	}

	// 환불 폼 페이지
	@RequestMapping(value = "/RefundForm", method = RequestMethod.POST)
	public ModelAndView RefundForm(@ModelAttribute ReservationVO rvo, HttpSession session) {
		ModelAndView model = new ModelAndView();

		ReservationVO res = new ReservationVO();

		rvo.setMem_id((String) session.getAttribute("id"));
		res = refundService.reservationdetail(rvo);

		if (session.getAttribute("ClientLogin") != null) {
			model.addObject("detail", res);
			model.setViewName("client/refund/refundForm");
		}
		return model;
	}

	// 환불 요청
	@RequestMapping(value = "/refrequest", method = RequestMethod.POST)
	public ModelAndView refrequest(@ModelAttribute ReservationVO rvo, @ModelAttribute RefundVO refvo
			, @ModelAttribute AdminMemberReservationVO amrvo) {
		log.info("환불요청 메서드 호출성공");

		int result = 0;
		ModelAndView mav = new ModelAndView();
		System.out.println(refvo.getBk_user());
		result = refundService.refrequest(rvo);
		if (result == 1) {
			refundService.rentalinsert(amrvo);
			refundService.refundInsert(refvo);
			mav.setViewName("client/mainview/mainView");
		} else {
			mav.addObject("errcode", 1);
			mav.setViewName("client/mainview/mainView");
		}
		System.out.println(result + "<<환불결과");
		return mav;
	}
}
