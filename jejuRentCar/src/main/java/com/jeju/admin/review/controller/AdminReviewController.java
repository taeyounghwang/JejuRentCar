package com.jeju.admin.review.controller;

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
import com.jeju.admin.qna.controller.AdminQnaController;
import com.jeju.admin.review.service.AdminReviewService;
import com.jeju.admin.review.vo.AdminReviewVO;

@Controller
@RequestMapping(value = "/admin/reviewboard")
public class AdminReviewController {
	private Logger log = LoggerFactory.getLogger(AdminQnaController.class);

	@Inject
	AdminReviewService adminReviewService;

	// 1. 후기글 전체 리스트
	@RequestMapping("/review")
	public ModelAndView list(@ModelAttribute AdminReviewVO vo, HttpSession session) throws Exception {
		log.info("review list 호출 성공");

		// 전체 레코드수 구현
		int total = adminReviewService.revListCnt(vo);
		log.info("total = " + total);
		
		//정렬 강제주입
		vo.setOrder_by("re_number");

		// 글번호 재설정
		int count = total - (Util.nvl(vo.getPage()) - 1) * Util.nvl(vo.getPageSize());
		log.info("count = " + count);

		List<AdminReviewVO> list = adminReviewService.list(vo);
		ModelAndView mav = new ModelAndView();
		ModelAndView rev = new ModelAndView();

		if (session.getAttribute("AdminLogin") == null) {
			rev.setViewName("redirect:/admin");
			return rev;
		} else {
			mav.setViewName("admin/review/adminReview");
			mav.addObject("list", list);
			mav.addObject("count", count);
			mav.addObject("total", total);
			mav.addObject("data", vo);
			return mav;
		}
	}

	// 2-1. 후기 상세 내용 조회
	@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam int re_number, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/review/adminReviewDetail");
		mav.addObject("vo", adminReviewService.detail(re_number));
		return mav;
	}

	// 2-2. 관리자 댓글 처리(등록,수정)
	@RequestMapping(value = "/reDetailUpdate", method = RequestMethod.POST)
	public String reUpdate(@ModelAttribute AdminReviewVO vo) throws Exception {
		log.info("reUpdate 호출 성공");

		int result = 0;
		String url = "";

		result = adminReviewService.reUpdate(vo);

		if (result == 1) {
			url = "/admin/reviewboard/review";
		} else {
			url = "/admin/reviewboard/reviewDetail?re_number = " + vo.getRe_number();
		}
		return "redirect:" + url;
	}

	// 2-3. 댓글 답변 삭제
	@RequestMapping("/reReDelete")
	public String reDelete(@RequestParam int re_number) throws Exception {
		adminReviewService.reDelete(re_number);
		return "redirect:/admin/reviewboard/review";
	}

	// 3. 후기 삭제
	@RequestMapping("/reListDelete")
	public String delete(@RequestParam int re_number) throws Exception {
		adminReviewService.delete(re_number);
		return "redirect:/admin/reviewboard/review";
	}
}
