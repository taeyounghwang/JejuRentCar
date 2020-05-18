package com.jeju.client.refund.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.admin.member.reservation.vo.AdminMemberReservationVO;
import com.jeju.client.refund.dao.RefundDao;
import com.jeju.client.refund.vo.RefundVO;
import com.jeju.client.reservation.vo.ReservationVO;

@Service
@Transactional
public class RefundServiceImpl implements RefundService {
	
	@Inject
	private RefundDao refundDao;
	
	@Override
	public int rescancel(ReservationVO rvo) {
		return refundDao.rescancel(rvo);
	}
	
	@Override
	public int refrequest(ReservationVO rvo) {
		return refundDao.refrequest(rvo);
	}
	
	@Override
	public ReservationVO reservationdetail(ReservationVO rvo) {
		return refundDao.reservationdetail(rvo);
	}

	@Override
	public int refundInsert(RefundVO refvo) {
		return refundDao.refundInsert(refvo);
	}

	@Override
	public int rentalinsert(AdminMemberReservationVO amrvo) {
		return refundDao.rentalinsert(amrvo);
	}

}
