package com.jeju.client.refund.dao;

import com.jeju.admin.member.reservation.vo.AdminMemberReservationVO;
import com.jeju.client.refund.vo.RefundVO;
import com.jeju.client.reservation.vo.ReservationVO;

public interface RefundDao {

	// 예약취소
	public int rescancel(ReservationVO rvo);

	// 환불요청
	public int refrequest(ReservationVO rvo);
	
	public ReservationVO reservationdetail(ReservationVO rvo);
	
	public int refundInsert(RefundVO refvo);
	
	public int rentalinsert(AdminMemberReservationVO amrvo);
}
