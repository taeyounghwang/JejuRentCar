package com.jeju.admin.member.list.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.admin.common.util.Util;
import com.jeju.admin.member.list.service.AdminMemberListService;
import com.jeju.admin.member.list.vo.AdminMemberListVO;

@Controller
@RequestMapping(value = "/admin/memberlist")
public class AdminMemberListController {
	private Logger log = LoggerFactory.getLogger(AdminMemberListController.class);

	@Inject
	AdminMemberListService adminMemberListService;

	// 1.회원 리스트
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public ModelAndView memList(@ModelAttribute AdminMemberListVO vo, HttpSession session) throws Exception {
		
		// vo.setOrder_by("mem_id");  정렬 사용시 강제 주입 필요..
		
		log.info("memList 호출 성공");

		// 전체 레코드수 구현
		int total = adminMemberListService.memListCnt(vo);
		log.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(vo.getPage()) - 1) * Util.nvl(vo.getPageSize());
		log.info("count = " + count);

		List<AdminMemberListVO> memList = adminMemberListService.memList(vo);
		ModelAndView mav = new ModelAndView();
		ModelAndView list = new ModelAndView();

		if (session.getAttribute("AdminLogin") == null) {
			list.setViewName("redirect:/admin");
			return list;
		} else {
			mav.setViewName("admin/memberlist/adminMemberList");
			mav.addObject("memList", memList);
			mav.addObject("count", count);
			mav.addObject("total", total);
			mav.addObject("data", vo);
			return mav;
		}
	}

	// 2. 회원 리스트 상세 내역 폼
	@RequestMapping(value = "/memberListDetailForm", method = RequestMethod.GET)
	public ModelAndView memDetail(@RequestParam String mem_id, HttpSession session) throws Exception {
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("admin/memberlist/adminMemberListDetail");
		// 뷰에 전달할 데이터
		mav.addObject("vo", adminMemberListService.memDetail(mem_id));
		return mav;
	}

	// 2-2. 회원 상태값 수정 처리
	@RequestMapping(value = "/memberListDetail", method = RequestMethod.POST)
	public String memUpdate(@ModelAttribute AdminMemberListVO vo) throws Exception {
		log.info("update 호출 성공");

		int result = 0;
		String url = "";

		result = adminMemberListService.memUpdate(vo);

		if (result == 1) {
			url = "/admin/memberlist/memberList";

		} else {
			url = "/admin/memberlist/memberListDetailForm?mem_id = " + vo.getMem_id();
		}

		return "redirect:" + url;
	}
}
