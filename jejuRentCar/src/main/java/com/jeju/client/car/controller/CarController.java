package com.jeju.client.car.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.admin.common.file.FileUploadUtil;
import com.jeju.client.car.service.CarService;
import com.jeju.client.car.vo.CarVO;

@Controller
@RequestMapping(value = "/car")
public class CarController {
	private Logger log = LoggerFactory.getLogger(CarController.class);

	@Autowired
	private CarService carService;

	// 차량 이미지 리스트 출력
	   @RequestMapping(value = "/List", method = RequestMethod.GET)
	   public ModelAndView carList(@ModelAttribute CarVO cvo,  HttpServletRequest request) throws Exception {

	      log.info("carList 호출완료");

	      if (cvo.getFile() != null) {
	         String car_image = FileUploadUtil.fileUpload(cvo.getFile(), request, "carList");
	         cvo.setCar_image(car_image);
	      }

	      ModelAndView mav = new ModelAndView();

	      List<CarVO> carList = carService.carList(cvo);

	      mav.addObject("carList", carList);
	      mav.setViewName("client/car/carList");
	      return mav;
	   }

	// 차량 상세 조회 페이지
	@RequestMapping(value = "/Detail", method = RequestMethod.GET)
	public String carDetail(@ModelAttribute CarVO cvo, Model model, HttpServletRequest request) throws Exception {
		
		
		
		log.info("carDetail 호출 성공");
		log.info("CAR_number= " + cvo.getCar_model_number());
		 if (cvo.getFile() != null) {
	         String car_image = FileUploadUtil.fileUpload(cvo.getFile(), request, "detail");
	         cvo.setCar_image(car_image);
	      }


		CarVO detail = new CarVO();
		detail = carService.carDetail(cvo);

		/* String encodedParam = URLEncoder.encode(detail.getCAR_NUMBER(), "UTF-8"); */
		log.info("CAR_number2= " + detail.getCar_model_number());
		/*
		 * if(detail != null) {
		 * detail.setCAR_NAME(detail.getCAR_NAME().toString().replace("|n", "<br>"));
		 * 
		 * }
		 */
		model.addAttribute("detail", detail);

		
		return "client/car/carDetail";

	}
}
