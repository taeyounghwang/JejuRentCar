package com.jeju.admin.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.admin.common.file.FileUploadUtil;
import com.jeju.admin.common.util.Util;
import com.jeju.admin.notice.service.AdminNoticeService;
import com.jeju.admin.notice.vo.AdminNoticeVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminNoticeController {
	private Logger log = LoggerFactory.getLogger(AdminNoticeController.class);

	@Autowired
	private AdminNoticeService adminNoticeService;

	// 1.공지사항 리스트
	@RequestMapping(value = "/noticeboard/notice", method = RequestMethod.GET)
	public ModelAndView NoticeList(@ModelAttribute AdminNoticeVO vo, HttpSession session) throws Exception {

		log.info("admin adminNotice 호출 성공");

		vo.setOrder_by("nt_number"); // 정렬 때문에 직접 강제로 정렬할 칼럼 값을 오더바이
		
		// 전체 레코드수 구현
		int total = adminNoticeService.listCnt(vo);
		log.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(vo.getPage()) - 1) * Util.nvl(vo.getPageSize());
		log.info("count = " + count);

		List<AdminNoticeVO> notList = adminNoticeService.NoticeList(vo);
		ModelAndView mav = new ModelAndView();
		ModelAndView login = new ModelAndView();

		if (session.getAttribute("AdminLogin") == null) {
			login.setViewName("redirect:/admin");
			return login;
		} else {
			mav.setViewName("admin/noticeboard/adminNotice");
			mav.addObject("NoticeList", notList);
			mav.addObject("total", total);
			mav.addObject("count", count);
			mav.addObject("data", vo);

			return mav;
		}

	}

	// 2.공지사항 상세 내역
	@RequestMapping(value = "/noticeboard/noticeDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam int nt_number, HttpSession session) throws Exception {
		log.info("admin Detail 호출 성공");
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("admin/noticeboard/adminNoticeDetail");
		// 뷰에 전달할 데이터
		mav.addObject("vo", adminNoticeService.detail(nt_number));
		return mav;
	}

	// 3-1.공지사항 등록
	@RequestMapping("/noticeboard/noticeInsertForm")
	public ModelAndView insertForm(AdminNoticeVO vo, HttpSession session, HttpServletRequest request) throws Exception {
		log.info("admin noticeInsert 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		ModelAndView login = new ModelAndView();
		
		
		
		if (session.getAttribute("AdminLogin") == null) {
			login.setViewName("admin/login/adminLogin");
			return login;
		} else {
			mav.setViewName("admin/noticeboard/adminNoticeInsert"); // 뷰 설정
			return mav;
		}
	}

	// 3-2.공지사항 등록
	@RequestMapping(value = "/noticeboard/noticeInsert", method = RequestMethod.POST)
	public String insert(@ModelAttribute AdminNoticeVO vo, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		log.info("insert 호출 성공");

		int result = 0;

		if (vo.getFile() != null) {
			String nt_image = FileUploadUtil.fileUpload(vo.getFile(), request, "notice");
			vo.setNt_image(nt_image);
		}

		result = adminNoticeService.noticeInsert(vo);

		if (result == 1) {
			return "redirect:/admin/noticeboard/notice";
		} else {
			return "redirect:/admin/noticeboard/noticeInsertForm";
		}
	}

	// 4-1.공지사항 수정 폼
	@RequestMapping(value = "/noticeboard/noticUpdateForm", method = RequestMethod.POST)
	public ModelAndView updateForm(@RequestParam int nt_number, HttpSession session) throws Exception {
		log.info("admin updateForm 호출 성공");
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("admin/noticeboard/adminNoticeUpdate");
		// 뷰에 전달할 데이터
		mav.addObject("vo", adminNoticeService.detail(nt_number));
		return mav;
	}

	// 4-2.공지사항 수정 처리
	@RequestMapping(value = "/noticeboard/noticeUpdate", method = RequestMethod.POST)
	public String update(@ModelAttribute AdminNoticeVO vo, Model model,  HttpServletRequest request) throws Exception {
		log.info("update 호출 성공");

		System.out.println(vo.getNt_number());
		
		int result = 0;
		String url = "";
		String nt_image = "";
		
		if (!vo.getFile().isEmpty()) {
			System.out.println("여기1");
			
			log.info("==========file = " + vo.getFile().getOriginalFilename());
			if (vo.getNt_image() != null && vo.getNt_image().length() != 0) {
				FileUploadUtil.fileDelete(vo.getNt_image(), request);
			}
			nt_image = FileUploadUtil.fileUpload(vo.getFile(), request, "notice");
			vo.setNt_image(nt_image);
		} else {
			log.info("첨부파일 없음");
			vo.setNt_image(nt_image);
		}
		
		log.info("============car_image = " + vo.getNt_image());
		
		
		result = adminNoticeService.update(vo);

		if (result == 1) {
			url = "/admin/noticeboard/notice";

		} else {
			url = "/admin/noticeboard/noticeDetail?nt_number = " + vo.getNt_number();
		}

		return "redirect:" + url;
	}

	// 5.공지사항 삭제
	@RequestMapping("/noticeboard/noticeDelete")
	public String delete(@RequestParam int nt_number) throws Exception {
		log.info("admin noticeDelete 성공");
		adminNoticeService.delete(nt_number);
		return "redirect:/admin/noticeboard/notice";
	}

}
