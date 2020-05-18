package com.jeju.client.refund.service;

import com.jeju.admin.member.reservation.vo.AdminMemberReservationVO;
import com.jeju.client.refund.vo.RefundVO;
import com.jeju.client.reservation.vo.ReservationVO;

public interface RefundService {

	// 예약 취소
	public int rescancel(ReservationVO rvo);

	// 환불 요청
	public int refrequest(ReservationVO rvo);
	
	// 환불 테이블에 insert
	public int refundInsert(RefundVO refvo);
	
	public ReservationVO reservationdetail(ReservationVO rvo);
	
	public int rentalinsert(AdminMemberReservationVO amrvo);
}
