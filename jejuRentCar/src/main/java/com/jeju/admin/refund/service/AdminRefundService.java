package com.jeju.admin.refund.service;

import java.util.List;

import com.jeju.admin.refund.vo.AdminRefundVO;

public interface AdminRefundService {
	//1.환불 리스트
	public List<AdminRefundVO> refundList(AdminRefundVO vo);
	
	//1-1.전체 레코드 수
	public int refCnt(AdminRefundVO vo);
	
	//2.환불 상세 페이지
	public AdminRefundVO detail(int ref_number);
	
	//3.환불 상태 변경
	public int updateRefund(AdminRefundVO vo);
	
	//4.회원 예약 내역 업데이트
	public int updateReservation(AdminRefundVO vo);
	
	//5.차량 예약 내역 업데이트
	public int updateCarReservation(AdminRefundVO vo);

	

	
}
