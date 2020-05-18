package com.jeju.client.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.client.member.service.MemberService;
import com.jeju.client.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private Logger log = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService memberService;

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String memberform() {
		log.info("member form 호출 성공");
		return "client/member/memberform";
	}

	// 회원 가입 처리 메소드
	// 회원가입 실패 시 처리 포함
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView memberJoin(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session,
			HttpServletRequest request) throws Exception {
		
		int result = 0;
		
		log.info("Join post 호출 성공");

		ModelAndView mav = new ModelAndView();

		// 회원 가입 성공 시
		memberService.insertMember(mvo);
		
		System.out.println(memberService);
		
		mav.addObject("errcode", result);	
		
		
		mav.setViewName("/client/mainview/mainView"); // 회원가입 성공, 메인 페이지로 이동
		return mav;

	}

	// 회원 아이디 중복 체크 메서드
	@ResponseBody
	@RequestMapping(value = "/userIdConfirm", method = RequestMethod.POST)
	public String userIdCOnfirm(@RequestParam("mem_id") String mem_id) {
		int result = memberService.userIdConfirm(mem_id);
		return result + "";
	}
}
