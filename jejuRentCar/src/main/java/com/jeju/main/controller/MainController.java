package com.jeju.main.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main", method = {RequestMethod.GET,RequestMethod.POST})
	public String home(Locale locale, Model model) {
		logger.info("페이지 실행", locale);
		
		return "client/mainview/mainView";
	}
	
	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String intro(Locale locale, Model model) {
		logger.info("페이지 실행", locale);
		
		return "client/intro/introMain";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {
		logger.info("페이지 실행", locale);
		
		return "client/mypage/mypageList";
	}
	
	
	
}
