package com.jeju.client.mypage.service;

import java.util.List;

import com.jeju.client.member.vo.MemberVO;
import com.jeju.client.reservation.vo.ReservationVO;

public interface MypageService {

	public List<ReservationVO> reservation(ReservationVO rvo);
	
	
	public ReservationVO reservationdetail(ReservationVO rvo);
	
	// 내정보 수정 폼으로 이동을 하기 위한 비밀번호 확인 절차
	public MemberVO updateForm(MemberVO mvo);
	// 아이디 중복확인
	public String selectHash(String mem_id);
	// 예약 취소
	public int rescancel(ReservationVO rvo);
	// 환불 요청
	public int refrequest(ReservationVO rvo);
	// 내정보 수정 처리
	public int infoUpdate(MemberVO mvo) throws Exception;
	
	
	
}
