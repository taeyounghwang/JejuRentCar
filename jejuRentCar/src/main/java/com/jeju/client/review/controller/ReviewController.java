package com.jeju.client.review.controller;
import java.io.IOException;
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

import com.jeju.admin.common.file.FileUploadUtil;
import com.jeju.admin.common.util.Util;
import com.jeju.client.review.service.ReviewService;
import com.jeju.client.review.vo.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	

	@Inject
	private ReviewService review;
	
	private Logger log = LoggerFactory.getLogger(ReviewController.class);
	
	
	
	@RequestMapping(value = "/list",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView list(@ModelAttribute ReviewVO rvvo,HttpSession session) {
		ModelAndView model = new ModelAndView();
		//선언
		List<ReviewVO> R_list = review.review(rvvo);
			
		//전체 레코드 수  구현
		int total = review.listCnt(rvvo);
		log.info("total ="+ total);
		
		//글번호 재설정
		int count = total - (Util.nvl(rvvo.getPage()) - 1) * Util.nvl(rvvo.getPageSize());
		log.info("count = " + count);
		
		model.setViewName("client/review/ReviewList");
		model.addObject("total" , total);
		model.addObject("count", count);
		model.addObject("review_board",R_list);
		model.addObject("data" ,rvvo);
		
		return model;
	}
	
	@RequestMapping(value = "/detail",method = RequestMethod.GET)
	public ModelAndView detail(@ModelAttribute ReviewVO rvvo) {
		ModelAndView model = new ModelAndView();
		
		ReviewVO rev = new ReviewVO();
		rev = review.detail(rvvo);
		
		model.addObject("detail",rev);
		model.setViewName("client/review/ReviewDetail");
		
		return model;
	}
	@RequestMapping(value = "/reviewDelete")
	public String reviewDelete(@RequestParam("re_number") int re_number,HttpSession session) throws Exception{
		log.info("reviewDelete");
		
		if(session.getAttribute("ClientLogin")==null) {
			return "redirect:/main";
		} else {
			review.reviewDetaildelete(re_number);
			return "redirect:/review/list";
		}
		
	}
	
	@RequestMapping(value = "/ReviewForm", method = RequestMethod.GET)
	public String ReviewForm(HttpSession session) {
		log.info("후기 insert form 호출 성공");
		
		return "/client/review/ReviewForm";
		
	}
	
	@RequestMapping(value = "/ReviewInsert", method = RequestMethod.POST)
	public String ReviewInsert(@ModelAttribute ReviewVO rvvo, Model model, HttpServletRequest request, HttpSession session)
			throws IllegalStateException, IOException {
		// log
		log.info("insert 호출 성공");
		
		int result = 0;
		
		if (rvvo.getFile() != null) {
			String re_image1 = FileUploadUtil.fileUpload(rvvo.getFile(), request, "ReviewImage");
			rvvo.setRe_image1(re_image1);
		}
		
		result = review.revInsert(rvvo);
		
		if (result == 1) {
			return "redirect:/review/list";
		} else {
			model.addAttribute("code", 1);
			return "redirect:/review/ReviewForm";
		}
	}
	
}
