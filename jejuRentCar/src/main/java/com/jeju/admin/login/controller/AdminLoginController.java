package com.jeju.admin.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.admin.login.service.AdminLoginService;
import com.jeju.admin.login.vo.AdminLoginVO;

@Controller
@RequestMapping("/")
public class AdminLoginController {
	private Logger log = LoggerFactory.getLogger(AdminLoginController.class);

	@Autowired
	private AdminLoginService adminLoginService;

	// 1.관리자 로그인페이지 매핑
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String login() {
		log.info("login get 호출 성공");
		return "admin/login/adminLogin";
	}

	// 2.관리자 로그인 체크
	@RequestMapping(value = "/admin/login", method = RequestMethod.POST)
	public ModelAndView loginChecked(@ModelAttribute("AdminLoginVO") AdminLoginVO lvo, HttpSession session,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		// 로그인하는 관리자의 아이디와 비밀번호가 일치하는지에 대한 쿼리문이 담긴 adminLoginCheckResult
		AdminLoginVO adminLoginCheckResult = adminLoginService.loginCheck(lvo);

		// 로그인 성공
		if (adminLoginCheckResult != null) {
			session.setAttribute("AdminLogin", adminLoginCheckResult);
			session.setAttribute("AdminName", "관리자");
			mav.setViewName("redirect:/admin/memreservation/memRes");// 관리자 첫페이지(회원 예약 내역)이동
			return mav;
		// 로그인 실패
		} else {
			mav.setViewName("redirect:/admin"); // 로그인 페이지 이동
			return mav;
		}

	}

	// 3.관리자 로그아웃
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/login/adminLogin");
		return mav;
	}

}
