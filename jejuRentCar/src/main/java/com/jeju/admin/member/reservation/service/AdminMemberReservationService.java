package com.jeju.admin.member.reservation.service;

import java.util.List;

import com.jeju.admin.member.reservation.vo.AdminMemberReservationVO;

public interface AdminMemberReservationService {
		
	//회원 예약 리스트
	public List<AdminMemberReservationVO> memResList(AdminMemberReservationVO vo)throws Exception;
	
	//회원 예약 상세 정보
	public AdminMemberReservationVO detail(int rsv_number)throws Exception;
	
	//회원 예약 상태 변경 저장
	public int update(AdminMemberReservationVO vo);
	
	//전체 레코드 수 구현
	public int memResListCnt(AdminMemberReservationVO vo);
	
	//차량 예약 관리로 인설트
	public int insert(AdminMemberReservationVO vo);

	//1월 매출액,예약건수
	public AdminMemberReservationVO selectJan(AdminMemberReservationVO rvo);
	public int selectJanCnt(AdminMemberReservationVO rvo);
	//2월 매출액,예약건수
	public AdminMemberReservationVO selectFeb(AdminMemberReservationVO rvo);
	public int selectFebCnt(AdminMemberReservationVO rvo);
	//3월 매출액,예약건수
	public AdminMemberReservationVO selectMar(AdminMemberReservationVO rvo);
	public int selectMarCnt(AdminMemberReservationVO rvo);
	//4월 매출액,예약건수
	public AdminMemberReservationVO selectApr(AdminMemberReservationVO rvo);
	public int selectAprCnt(AdminMemberReservationVO rvo);
	//5월 매출액,예약건수
	public AdminMemberReservationVO selectMay(AdminMemberReservationVO rvo); 
	public int selectMayCnt(AdminMemberReservationVO rvo);
	//6월 매출액,예약건수
	public AdminMemberReservationVO selectJun(AdminMemberReservationVO rvo); 
	public int selectJunCnt(AdminMemberReservationVO rvo);
	//7월 매출액,예약건수
	public AdminMemberReservationVO selectJul(AdminMemberReservationVO rvo); 
	public int selectJulCnt(AdminMemberReservationVO rvo);
	//8월 매출액,예약건수
	public AdminMemberReservationVO selectAug(AdminMemberReservationVO rvo); 
	public int selectAugCnt(AdminMemberReservationVO rvo);
	//9월 매출액,예약건수
	public AdminMemberReservationVO selectSept(AdminMemberReservationVO rvo); 
	public int selectSeptCnt(AdminMemberReservationVO rvo);
	//10월 매출액,예약건수
	public AdminMemberReservationVO selectOct(AdminMemberReservationVO rvo); 
	public int selectOctCnt(AdminMemberReservationVO rvo);
	//11월 매출액,예약건수
	public AdminMemberReservationVO selectNov(AdminMemberReservationVO rvo); 
	public int selectNovCnt(AdminMemberReservationVO rvo);
	//12월 매출액,예약건수
	public AdminMemberReservationVO selectDec(AdminMemberReservationVO rvo); 
	public int selectDecCnt(AdminMemberReservationVO rvo);
	
}
