package com.jeju.admin.refund.controller;

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
import com.jeju.admin.refund.service.AdminRefundService;
import com.jeju.admin.refund.vo.AdminRefundVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminRefundController {
	private Logger log = LoggerFactory.getLogger(AdminRefundController.class);

	@Autowired
	private AdminRefundService adminRefundService;

	// 1.환불 신청 리스트
	@RequestMapping(value = "/refund/reFund", method = RequestMethod.GET)
	public ModelAndView refundList(@ModelAttribute AdminRefundVO vo, HttpSession session) {

		log.info("admin refund 호출 성공");
		
		vo.setOrder_by("ref_number");
		
		// 전체 레코드수 구현
		int total = adminRefundService.refCnt(vo);
		log.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(vo.getPage()) - 1) * Util.nvl(vo.getPageSize());
		log.info("count = " + count);
		
		List<AdminRefundVO> refList = adminRefundService.refundList(vo);
		
		ModelAndView mav = new ModelAndView();
		ModelAndView login = new ModelAndView();
		
		if (session.getAttribute("AdminLogin") == null) {
			login.setViewName("redirect:/admin");
			return login;
		} else {
			mav.addObject("refundList", refList);
			mav.addObject("total", total);
			mav.addObject("count", count);
			mav.addObject("data", vo);
			mav.setViewName("admin/refund/adminRefund");
			return mav;
		}
			
	}


	// 2.회원 예약 상세 내역
	@RequestMapping(value = "/refund/refundDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam int ref_number, HttpSession session) throws Exception {

		log.info("admin Detail 호출 성공");
		
		// 모델(데이터) + 뷰(화면)를 함께전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("admin/refund/adminRefundDetail");
		// 뷰에 전달할 데이터
		mav.addObject("vo", adminRefundService.detail(ref_number));

		return mav;
	}

	// 3.환불 상태 변경
	@RequestMapping(value = "/refund/adminrefundUpdate", method = RequestMethod.POST)
	public String updateRefund(@ModelAttribute AdminRefundVO vo) throws Exception {
		log.info("update 호출 성공");

		
		int result = 0;
		String url = "";
		
		result = adminRefundService.updateRefund(vo);//환불에 업데이트
		

		if (result == 1) {
			adminRefundService.updateReservation(vo);//회원 예약에 업데이트
			adminRefundService.updateCarReservation(vo);//차량 예약에 업데이트
			url = "/admin/refund/reFund";

		} else {
			url = "/admin/refund/reFund";
		}
		return "redirect:" + url;
	}

}
