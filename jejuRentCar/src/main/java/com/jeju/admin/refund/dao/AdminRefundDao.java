package com.jeju.admin.refund.dao;

import java.util.List;

import com.jeju.admin.refund.vo.AdminRefundVO;

public interface AdminRefundDao {
	//1.환불 리스트
	public List<AdminRefundVO> refundList(AdminRefundVO vo);
	
	// 1-1.전체 리스트 수
	public int refCnt(AdminRefundVO vo);
	
	//2.환불 내역 상세
	public AdminRefundVO detail(int ref_number);
	
	//3.환불 상태 변경 저장
	public int updateRefund(AdminRefundVO vo);
	
	//4.회원 예약 내역 업데이트
	public int updateReservation(AdminRefundVO vo);
	
	//5.차량 예약 내역 업데이트
	public int updateCarReservation(AdminRefundVO vo);
}
