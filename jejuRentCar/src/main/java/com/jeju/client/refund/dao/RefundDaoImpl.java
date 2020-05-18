package com.jeju.client.refund.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.jeju.admin.member.reservation.vo.AdminMemberReservationVO;
import com.jeju.client.refund.vo.RefundVO;
import com.jeju.client.reservation.vo.ReservationVO;

public class RefundDaoImpl implements RefundDao {
	
	@Inject
	private SqlSession session;
	
	@Override
	public int rescancel(ReservationVO rvo) {
		return session.update("rescancel", rvo);
	}
	@Override
	public int refrequest(ReservationVO rvo) {
		return session.update("refrequest", rvo);
	}
	@Override
	public ReservationVO reservationdetail(ReservationVO rvo) {
		return session.selectOne("reservationdetail",rvo);
	}
	@Override
	public int refundInsert(RefundVO refvo) {
		return session.insert("refundInsert", refvo);
	}
	@Override
	public int rentalinsert(AdminMemberReservationVO amrvo) {
		return session.update("rentalinsert", amrvo);
	}
}
