package com.jeju.admin.member.reservation.dao;

import java.util.List;

import com.jeju.admin.member.reservation.vo.AdminMemberReservationVO;

public interface AdminMemberReservationDao {
	//회원 예약 내역 리스트
	public List<AdminMemberReservationVO> memResList(AdminMemberReservationVO vo)throws Exception;
	
	//회원 예약 내역 상세
	public AdminMemberReservationVO detail(int rsv_number) throws Exception;
	
	//회원 상태 변경 저장
	public int update(AdminMemberReservationVO vo);
	
	//전체 레코드 수 구현
	public int memResListCnt(AdminMemberReservationVO vo);
	
	//차량 예약 관리로 인설트
	public int insert(AdminMemberReservationVO vo);

	//1월 매출액
	public AdminMemberReservationVO selectJan(AdminMemberReservationVO rvo);
	//1월 예약건수
	public int selectJanCnt(AdminMemberReservationVO rvo);
	//2월 매출액
	public AdminMemberReservationVO selectFeb(AdminMemberReservationVO rvo);
	//2월 예약건수
	public int selectFebCnt(AdminMemberReservationVO rvo);
	//3월 매출액
	public AdminMemberReservationVO selectMar(AdminMemberReservationVO rvo);
	//3월 예약건수
	public int selectMarCnt(AdminMemberReservationVO rvo);
	//4월 매출액
	public AdminMemberReservationVO selectApr(AdminMemberReservationVO rvo);
	//4월 예약건수
	public int selectAprCnt(AdminMemberReservationVO rvo);
	//5월 매출액
	public AdminMemberReservationVO selectMay(AdminMemberReservationVO rvo);
	//5월 예약건수
	public int selectMayCnt(AdminMemberReservationVO rvo);
	//6월 매출액
	public AdminMemberReservationVO selectJun(AdminMemberReservationVO rvo);
	//6월 예약건수
	public int selectJunCnt(AdminMemberReservationVO rvo);
	//7월 매출액
	public AdminMemberReservationVO selectJul(AdminMemberReservationVO rvo);
	//7월 예약건수
	public int selectJulCnt(AdminMemberReservationVO rvo);
	//8월 매출액
	public AdminMemberReservationVO selectAug(AdminMemberReservationVO rvo);
	//8월 예약건수
	public int selectAugCnt(AdminMemberReservationVO rvo);
	//9월 매출액
	public AdminMemberReservationVO selectSept(AdminMemberReservationVO rvo);
	//9월 예약건수
	public int selectSeptCnt(AdminMemberReservationVO rvo);
	//10월 매출액
	public AdminMemberReservationVO selectOct(AdminMemberReservationVO rvo);
	//10월 예약건수
	public int selectOctCnt(AdminMemberReservationVO rvo);
	//11월 매출액
	public AdminMemberReservationVO selectNov(AdminMemberReservationVO rvo);
	//11월 예약건수
	public int selectNovCnt(AdminMemberReservationVO rvo);
	//12월 매출액
	public AdminMemberReservationVO selectDec(AdminMemberReservationVO rvo);
	//12월 예약건수
	public int selectDecCnt(AdminMemberReservationVO rvo);
	

	

	

	
}
