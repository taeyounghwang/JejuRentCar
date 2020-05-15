package com.jeju.admin.car.list.controller;

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

import com.jeju.admin.car.list.service.AdminCarListService;
import com.jeju.admin.car.list.vo.AdminCarListVO;
import com.jeju.admin.common.file.FileUploadUtil;
import com.jeju.admin.common.util.Util;

@Controller
@RequestMapping(value = "/")
public class AdminCarListController {

	private Logger log = LoggerFactory.getLogger(AdminCarListController.class);

	@Inject
	AdminCarListService adminCarListService;

	// 1. 차량 리스트
	@RequestMapping("/admin/carlist/carList")
	public ModelAndView list(@ModelAttribute AdminCarListVO vo, HttpSession session) throws Exception {
		log.info("admin carlist 호출 성공");
		

		// 전체 레코드수 구현
		int total = adminCarListService.carListCnt(vo);
		log.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(vo.getPage()) - 1) * Util.nvl(vo.getPageSize());
		log.info("count = " + count);

		List<AdminCarListVO> list = adminCarListService.list(vo);
		ModelAndView mav = new ModelAndView();
		ModelAndView login = new ModelAndView();
		


		if (session.getAttribute("AdminLogin") == null) {
			login.setViewName("redirect:/admin");
			return login;
		} else {
			mav.setViewName("admin/carlist/adminCarList"); // 뷰 설정
			mav.addObject("list", list);
			mav.addObject("count", count);
			mav.addObject("total", total);
			mav.addObject("data", vo);
			return mav;
		}
	}

	// 2-1. 차량 등록화면
	@RequestMapping(value = "/admin/carlist/carListInsertForm", method = RequestMethod.GET)
	public ModelAndView insertForm(HttpSession session) {
		log.info("admin carListInsert 호출 성공");

		ModelAndView mav = new ModelAndView();
		ModelAndView insert = new ModelAndView();

		if (session.getAttribute("AdminLogin") == null) {
			mav.setViewName("admin/login/adminLogin");
			return mav;
		} else {
			insert.setViewName("admin/carlist/adminCarListInsert");
			return insert;
		}
	}

	// 2-2. 차량 등록 처리
	@RequestMapping(value = "/admin/carlist/carListInsert", method = RequestMethod.POST)
	public String insert(@ModelAttribute AdminCarListVO vo, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		log.info("insert 호출 성공");
		// 확인 후 주석 처리
		log.info("fileName : " + vo.getFile().getOriginalFilename());
		log.info("car_name : " + vo.getCar_name());

		int result = 0;

		if (vo.getFile() != null) {
			String car_image = FileUploadUtil.fileUpload(vo.getFile(), request, "carList");
			vo.setCar_image(car_image);
		}

		result = adminCarListService.listInsert(vo);
		if (result == 1) {
			return "redirect:/admin/carlist/carList";
		} else {
			model.addAttribute("code", 1);
			return "redirect:/admin/carlist/carListInsertForm";
		}
	}

	// 3. 리스트 상세내용 조회
	@RequestMapping(value = "/admin/carlist/carListDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam int car_model_number, HttpSession session) throws Exception {
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("admin/carlist/adminCarListDetail");
		// 뷰에 전달할 데이터
		mav.addObject("vo", adminCarListService.detail(car_model_number));
		return mav;
	}

	// 4-1. 차량 수정 폼
	@RequestMapping(value = "/admin/carlist/carListUpdateForm", method = RequestMethod.POST)
	public ModelAndView updateForm(@RequestParam int car_model_number, HttpSession session) throws Exception {
		log.info("updateForm 호출 성공");
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("admin/carlist/adminCarListUpdate");
		// 뷰에 전달할 데이터
		mav.addObject("vo", adminCarListService.detail(car_model_number));
		return mav;
	}

	// 4-2. 차량 수정 처리
	@RequestMapping(value = "/admin/carlist/carListUpdate", method = RequestMethod.POST)
	public String update(@ModelAttribute AdminCarListVO vo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		log.info("update 호출 성공");

		int result = 0;
		String url = "";
		String car_image = "";

		if (!vo.getFile().isEmpty()) {
			log.info("==========file = " + vo.getFile().getOriginalFilename());
			if (!vo.getCar_image().isEmpty()) {
				FileUploadUtil.fileDelete(vo.getCar_image(), request);
			}
			car_image = FileUploadUtil.fileUpload(vo.getFile(), request, "carList");
			vo.setCar_image(car_image);
		} else {
			log.info("첨부파일 없음");
			vo.setCar_image(car_image);
		}
		log.info("============car_image = " + vo.getCar_image());

		result = adminCarListService.update(vo);

		if (result == 1) {
			url = "/admin/carlist/carList";

		} else {
			url = "/admin/carlist/carListDetail?car_model_number = " + vo.getCar_model_number();
		}

		return "redirect:" + url;
	}

	// 5. 차량 삭제

	@RequestMapping("/admin/carlist/carLsitDelete")
	public String delete(@ModelAttribute AdminCarListVO vo, HttpServletRequest request) throws IOException {
		log.info("delete 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url = "";

		if (!vo.getCar_image().isEmpty()) {
			FileUploadUtil.fileDelete(vo.getCar_image(), request);
		}

		result = adminCarListService.delete(vo.getCar_model_number());
		if (result == 1) {
			url = "/admin/carlist/carList?page=" + "&pageSize = " + vo.getPageSize();
		} else {
			url = "/admin/carlist/carList?car_model_number=" + vo.getCar_model_number() + "&page=" + vo.getPage()
					+ "&pageSize=" + vo.getPageSize();
		}
		return "redirect:" + url;
	}
}
