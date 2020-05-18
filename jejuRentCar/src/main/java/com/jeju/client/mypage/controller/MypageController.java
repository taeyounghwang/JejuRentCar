package com.jeju.client.mypage.controller;

import java.util.List;

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

import com.jeju.client.car.service.CarService;
import com.jeju.client.car.vo.CarVO;
import com.jeju.client.member.vo.MemberVO;
import com.jeju.client.mypage.service.MypageService;
import com.jeju.client.reservation.vo.ReservationVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private Logger log = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	private MypageService mypage;
	
	@Inject
	private CarService car;
	
	
	//나의 예약정보 리스트
	@RequestMapping(value = "/list",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView list(@ModelAttribute ReservationVO rvo,HttpSession session) {
		ModelAndView model = new ModelAndView();
		
		
		
		rvo.setMem_id((String)session.getAttribute("id"));
		
		System.out.println("아이디="+rvo.getMem_id());
		
		List<ReservationVO> R_list = mypage.reservation(rvo);
		
		model.addObject("reservation",R_list);
		model.setViewName("client/mypage/mypageList");
		return model;
	}
	
	//나의 예약정보 리스트 상세페이지
	@RequestMapping(value = "/detail",method = RequestMethod.GET)
	public ModelAndView detail(@ModelAttribute ReservationVO rvo) {
		ModelAndView model = new ModelAndView();
		
		ReservationVO res = new ReservationVO();
		res = mypage.reservationdetail(rvo);
		
		CarVO cvo = new CarVO();
		cvo.setCar_model_number(res.getCar_model_number());
		
		
		CarVO cvo2 = new CarVO();
		cvo2 = car.carDetail(cvo);
		
		System.out.println("차 번호"+res.getCar_model_number());
		
		model.addObject("car",cvo2);
		model.addObject("detail",res);
		model.setViewName("client/mypage/mypageListDetail");
		
		return model;
	}
	// 내 정보 수정 페이지 이동
		@RequestMapping(value = "/updatepw", method = RequestMethod.GET)
		public String idpwfind() {
			log.info("mypage 정보 수정 호출 성공");
			return "client/mypage/mypageUpdatePW";
		}
	
	// 내 정보 수정 기능
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		@ResponseBody
		public int myInfoUpdate(@ModelAttribute MemberVO mvo) {
			
			log.info("mypage 정보 수정 호출 성공");
			
			int result = 0;
			
			try {
				mvo = mypage.updateForm(mvo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if (mvo == null) {
				result = 1;
			} else {
				result = 2;
			}
			
			return result;
		}
	
		// 내정보 수정폼		
		@RequestMapping(value = "/mypageUpdate", method = RequestMethod.GET)
		public String myInfoUpdateForm() {
			log.info("내정보 수정 폼 호출성공");
			return "client/mypage/mypageUpdate";
		}
		
		@RequestMapping(value = "/refundRequest", method = RequestMethod.POST)
		public ModelAndView refundRequest(@ModelAttribute ReservationVO rvo, HttpSession session) {
			ModelAndView model = new ModelAndView();
			
			ReservationVO rsvo = new ReservationVO();
			
			rvo.setMem_id((String)session.getAttribute("id"));
		/* mypage.refrequest(rvo); */
			rsvo = mypage.reservationdetail(rvo);
			
			model.addObject("detail",rsvo);
			model.setViewName("client/refund/refundDone");
			
			return model;
		}
		@RequestMapping(value = "/infoUpdate", method = RequestMethod.POST)
		public ModelAndView infoUpdate(@ModelAttribute MemberVO mvo, HttpSession session) throws Exception {
			
			log.info("infoUpdate 메소드 호출성공");
			
			ModelAndView mav = new ModelAndView();
			
			int result = 0;
			
			result = mypage.infoUpdate(mvo);
			
			if (result == 1) {
			mav.setViewName("redirect:/main");	
			} else {
			mav.setViewName("/mypage/updatepw");
			}
			return mav;
		}
	 
	 
}
