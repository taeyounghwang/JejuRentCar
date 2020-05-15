package com.jeju.admin.car.reservation.dao;

import java.util.List;

import com.jeju.admin.car.reservation.vo.AdminCarReservationVO;

public interface AdminCarReservationDao {
	
	//1.차량 예약 관리 리스트
	public List<AdminCarReservationVO> carResList(AdminCarReservationVO vo);
	
	// 1-1.전체 리스트 수
	public int listCnt(AdminCarReservationVO vo);
	
	//2.차량 예약 관리 내역 상세
	public AdminCarReservationVO detail(int ren_number) throws Exception;
	
	//3.차량 예약 관리 내역 변경 저장
	public int update(AdminCarReservationVO vo);

	//4.회원 예약 관리로 업데이트
	public int change(AdminCarReservationVO vo);
	

}
