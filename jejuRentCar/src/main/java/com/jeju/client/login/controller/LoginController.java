package com.jeju.client.login.controller;

import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.client.login.service.LoginService;
import com.jeju.client.login.vo.LoginVO;
import com.jeju.client.member.vo.MemberVO;
import com.jeju.client.notice.vo.NoticeVO;

@Controller
@RequestMapping("/login")
public class LoginController {
	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Inject
	private LoginService loginService;
	@Inject
	private JavaMailSender mailSender;

	/**************************************
	 * 로그인 화면 보여주기 위한 메서드
	 ************************************/
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String login() {
		log.info("login get 호출 성공");
		return "client/login/loginForm";
	}

	// 로그인 처리 메소드
	// 로그인 실패 시 처리할 내용 포함
	@ResponseBody
	@RequestMapping(value = "/goin", method = RequestMethod.POST)
	public int memberlogin(@ModelAttribute("LoginVO") LoginVO lvo, HttpSession session,
			HttpServletRequest request) {
		log.info("Login post 호출 성공");
		int result = 0;
		
		try {
			lvo = loginService.loginSelect(lvo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (lvo == null) { 
			result = 1; // 로그인 실패시
			return result;
		} else if (lvo.getMem_state().equals("비활성화")) {
			result = 2; // 비활성화 계정일시
			return result;
		} // 로그인 성공시
		else {
			session.setAttribute("id", lvo.getMem_id());
			session.setAttribute("ClientLogin", lvo);

			return result; // 로그인 성공시 0을 리턴
		}

	}

	// 아이디 비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/idpwfind", method = RequestMethod.GET)
	public String idpwfind() {
		log.info("idpwfind get 호출 성공");
		return "client/login/idpwfind";
	}

	// 로그아웃 버튼 클릭시 로그인 세션 파기
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		log.info("logout 호출 성공");
		session.invalidate();
		return "client/mainview/mainView";
	}

	// 아이디 찾기 메서드
	@ResponseBody
	@RequestMapping(value = "/idfind", method = { RequestMethod.POST, RequestMethod.GET })
	public int idfind(@ModelAttribute MemberVO mvo) {

		log.info("idfind 호출 성공");

		int result = 0;

		List<NoticeVO> member = loginService.userIdfind(mvo);

		if (member != null) {
			result = 2;
		} else {
			result = 1;
		}

		return result;
	}

	// 아이디 찾기 결과 창 메서드
	@RequestMapping(value = "/idresult", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView userIdFind(@ModelAttribute MemberVO mvo) {

		log.info("userIdFind 호출 성공");

		ModelAndView mav = new ModelAndView();

		List<NoticeVO> member = loginService.userIdfind(mvo);

		mav.addObject("id", member);

		mav.setViewName("client/login/idresult");

		return mav;
	}

	// 비밀번호 찾기 메서드
	@ResponseBody
	@RequestMapping(value = "/pwfind", method = { RequestMethod.POST, RequestMethod.GET })
	public int pwfind(@ModelAttribute MemberVO mvo, HttpServletRequest request) {

		log.info("pwfind 호출 성공");

		// 선언부
		String tempPw = (int) (Math.random() * 100000000) + ""; // 임시 비밀번호 생성
		int result = 0;
		MemberVO mvo1 = new MemberVO();

		mvo.setMem_password(tempPw); // 임시 비밀번호 set

		String toMail = mvo.getMem_id();

		String content = toMail + "<h2>님 안녕하세요 제주렌트카 입니다!</h2><br><br>"
				+ "<h3>회원님의 비밀번호는 [" + tempPw + "]입니다</h3>. <h3>비밀번호 변경을 해주세요.</h3>"
						+ "<a href='http://localhost:8080/main'>제주렌트카 홈페이지</a>";

		mvo1 = loginService.pwSearch(mvo);

		if (mvo1 != null) {
			try {
				MimeMessage message = mailSender.createMimeMessage();
				
				message.setSubject("[임시비밀번호] 중요!제주렌트카 임시비밀번호 메일입니다."); // 메일제목 (생략가능)
				message.setText(content, "utf-8", "html"); // 메일 내용
		        message.addRecipient(RecipientType.TO, new InternetAddress(toMail));
				mailSender.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			result = 1;
		} else {
			result = 2;
			return result;
		}

		try {
			result = loginService.updatePw(mvo); // 임시 비밀번호를 db에 저장
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

}
