package com.jeju.admin.qna.controller;

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
import com.jeju.admin.qna.service.AdminQnaService;
import com.jeju.admin.qna.vo.AdminQnaVO;

@Controller
@RequestMapping(value = "/admin/qnaboard")
public class AdminQnaController {
	private Logger log = LoggerFactory.getLogger(AdminQnaController.class);

	@Inject
	private AdminQnaService adminQnaService;

	// 1. 문의글 전체 리스트
	@RequestMapping("/qnaboard")
	public ModelAndView list(@ModelAttribute AdminQnaVO vo, HttpSession session) throws Exception {
		log.info("qna list 호출 성공");
		
		//vo.setOrder_by("inq_number"); //정렬 사용 시 강제 주입 필요...

		// 전체 레코드수 구현
		int total = adminQnaService.qnaListCnt(vo);
		log.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(vo.getPage()) - 1) * Util.nvl(vo.getPageSize());
		log.info("count = " + count);

		List<AdminQnaVO> list = adminQnaService.list(vo);
		ModelAndView mav = new ModelAndView();
		ModelAndView qna = new ModelAndView();

		if (session.getAttribute("AdminLogin") == null) {
			qna.setViewName("redirect:/admin");
			return qna;
		} else {
			mav.setViewName("admin/qna/adminQna");
			mav.addObject("list", list);
			mav.addObject("count", count);
			mav.addObject("total", total);
			mav.addObject("data", vo);
			return mav;
		}
	}

	// 2-1. 리스트 상세 내용 조회
	@RequestMapping(value = "/qnaDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam int inq_number, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/qna/adminQnaDetail");
		mav.addObject("vo", adminQnaService.detail(inq_number));
		return mav;
	}

	// 2-2. 답변 댓글 처리(등록,수정)
	@RequestMapping(value = "/qnaDetailUpdate", method = RequestMethod.POST)
	public String reUpdate(@ModelAttribute AdminQnaVO vo) throws Exception {
		log.info("update 호출 성공");

		int result = 0;
		String url = "";

		result = adminQnaService.reUpdate(vo);

		if (result == 1) {
			url = "/admin/qnaboard/qnaboard";
		} else {
			url = "/admin/qnaboard/qnaDetail?inq_number = " + vo.getInq_number();
		}
		return "redirect:" + url;
	}

	// 2-3. 댓글 답변 삭제
	@RequestMapping("/qnaReDelete")
	public String reDelete(@RequestParam int inq_number) throws Exception {
		adminQnaService.reDelete(inq_number);
		return "redirect:/admin/qnaboard/qnaboard";
	}

	// 3. 글 삭제
	@RequestMapping("/qnaListDelete")
	public String delete(@RequestParam int inq_number) throws Exception {
		adminQnaService.delete(inq_number);
		return "redirect:/admin/qnaboard/qnaboard";
	}

}
