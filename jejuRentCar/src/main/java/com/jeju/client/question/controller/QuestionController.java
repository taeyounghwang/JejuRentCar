package com.jeju.client.question.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.admin.common.util.Util;
import com.jeju.client.question.service.QuestionService;
import com.jeju.client.question.vo.QuestionVO;

@Controller
@RequestMapping("/question")
public class QuestionController {
	private Logger log = LoggerFactory.getLogger(QuestionController.class);

	@Inject
	private QuestionService questionService;

	// 리스트 조회
	@RequestMapping("/qnaboard")
	public ModelAndView qnalist(@ModelAttribute QuestionVO qvo, HttpSession session) throws Exception {
		log.info("qnaboard 호출 성공");

		List<QuestionVO> list = questionService.list(qvo);
		ModelAndView mav = new ModelAndView();
		ModelAndView qna = new ModelAndView();

		// 전체 레코드수 구현
		int total = questionService.qnaListCnt(qvo);
		log.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(qvo.getPage()) - 1) * Util.nvl(qvo.getPageSize());
		log.info("count = " + count);

		if (session.getAttribute("ClientLogin") == null) {
			qna.setViewName("client/login/loginForm");
			return qna;
		} else {
			mav.setViewName("client/question/questionList");
			mav.addObject("qnalist", list);
			mav.addObject("total", total);
			mav.addObject("count", count);
			mav.addObject("data1", qvo);
			return mav;
		}
	}

	// 게시물 상세 조회
	@RequestMapping(value = "/qnaDetail", method = { RequestMethod.POST, RequestMethod.GET})
	public ModelAndView detail(@RequestParam int inq_number, HttpSession session) throws Exception {
		log.info("qna deatil 호출 성공");

		ModelAndView mav = new ModelAndView();

		if (session.getAttribute("ClientLogin") == null) {
			mav.setViewName("redirect:/main");
			return mav;
		} else {
			mav.setViewName("client/question/questionDetail");
			mav.addObject("qnavo", questionService.detail(inq_number));
			return mav;
		}
	}

	// 글 삭제
	@RequestMapping("/qnaListDelete")
	public String qnaDelete(@RequestParam("inq_number") int inq_number, HttpSession session) throws Exception {

		log.info("qnaListDelete 호출 성공");

		if (session.getAttribute("ClientLogin") == null) {
			return "redirect:/main";
		} else {
			questionService.delete(inq_number);

			return "redirect:/question/qnaboard";
		}
	}

	// 문의사항 글 작성 페이지로 이동
	@RequestMapping("/qnainsertform")
	public String qnaInsertForm(HttpSession session) {

		log.info("qnaInsert 페이지 이동 호출 성공");

		if (session.getAttribute("ClientLogin") == null) {
			return "redirect:/main";
		} else {
			return "client/question/questionInsert";
		}

	}

	// 문의 사항 글 작성시 처리
	@RequestMapping("/qnaInsert")
	public String qnainsert(@ModelAttribute QuestionVO qvo, Model model, HttpSession session) {

		log.info("qnainsert 처리 요청 호출성공");

		if (session.getAttribute("ClientLogin") == null) {
			return "redirect:/main";
		} else {
			questionService.qnaInsert(qvo);
			return "redirect:/question/qnaboard";
		}
	}

	// 문의글 수정 폼
	@RequestMapping(value = "/qnaUpdateForm", method = RequestMethod.POST)
	public ModelAndView updateform(@RequestParam int inq_number, HttpSession session) throws Exception {

		log.info("qna update form 호출 성공");

		ModelAndView mav = new ModelAndView();

		if (session.getAttribute("ClientLogin") == null) {
			mav.setViewName("redirect:/main");
			return mav;
		}else {
			mav.setViewName("/client/question/questionUpdate");
			mav.addObject("detail", questionService.detail(inq_number));
			return mav;
		}
	}
	
	// 문의글 수정 처리
	@RequestMapping(value = "/qnaUpdate", method = { RequestMethod.POST, RequestMethod.GET})
	public String update(@ModelAttribute QuestionVO qvo, Model model, HttpSession session, HttpServletRequest req)throws Exception{
		log.info("qna update 호출 성공");
		
		
		int result = 0;
		String url = "";
		
		System.out.println("num"+qvo.getInq_number());
		
		result = questionService.update(qvo);
		if(result == 1 && session.getAttribute("ClientLogin") == null) {
			url = "/main";
		} else {
			url = "/question/qnaboard";
		}
		System.out.println("asdas");
		return "redirect:" + url;
	}

}
