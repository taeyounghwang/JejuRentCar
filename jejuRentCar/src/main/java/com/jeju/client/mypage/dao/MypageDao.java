package com.jeju.client.mypage.dao;

import java.util.List;

import com.jeju.client.member.vo.MemberVO;
import com.jeju.client.reservation.vo.ReservationVO;

public interface MypageDao {

	public List<ReservationVO> reservation(ReservationVO rvo);
	// 내정보 상세 페이지로 이동
	public ReservationVO reservationdetail(ReservationVO rvo);
	// 내정보 수정 폼으로 이동을 하기 위한 비밀번호 확인 절차
	public MemberVO pwChk(MemberVO mvo);
	// 아이디 중복확인
	public String selectHash(String mem_id);
	// 예약취소
	public int rescancel(ReservationVO rvo);
	// 환불요청
	public int refrequest(ReservationVO rvo);
	// 내정보 수정 처리
	public int infoUpdate(MemberVO mvo);
}
