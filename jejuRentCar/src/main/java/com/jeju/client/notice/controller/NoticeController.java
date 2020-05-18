package com.jeju.client.notice.controller;

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
import com.jeju.client.notice.service.NoticeService;
import com.jeju.client.notice.vo.NoticeVO;
import com.jeju.client.question.controller.QuestionController;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	private Logger log = LoggerFactory.getLogger(QuestionController.class);

	@Inject
	private NoticeService noticeService;

	// 공지 사항 리스트
	@RequestMapping("/list")
	public ModelAndView noticeList(@ModelAttribute NoticeVO nvo) throws Exception {

		log.info("notice list 호출 성공");

		// 선언
		ModelAndView mav = new ModelAndView();
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);

		// 전체 레코드수 구현
		int total = noticeService.listCnt(nvo);
		log.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(nvo.getPage()) - 1) * Util.nvl(nvo.getPageSize());
		log.info("count = " + count);

		mav.setViewName("client/notice/noticeList");
		mav.addObject("noticeList", noticeList);
		mav.addObject("total", total);
		mav.addObject("count", count);
		mav.addObject("data", nvo);

		return mav;
	}

	// 게시물 상세 조회
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam int nt_number, HttpSession session) throws Exception {
		log.info("notice deatil 호출 성공");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("client/notice/noticeDetail");
		mav.addObject("ntvo", noticeService.detail(nt_number));
		return mav;
	}
}
