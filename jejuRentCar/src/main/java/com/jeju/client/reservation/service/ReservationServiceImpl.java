package com.jeju.client.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.client.reservation.dao.ReservationDao;
import com.jeju.client.reservation.vo.ReservationVO;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;

	// ReservationFrom
	@Override
	public ReservationVO Reservation(ReservationVO RVO) {
		return reservationDao.Reservation(RVO);
	}

	@Override
	public int ReservationInsert(ReservationVO RVO) {
		int result = 0;
		try {
			result = reservationDao.ReservationInsert(RVO);
		}catch (Exception e) {
			e.printStackTrace();
			result=0;
		}
		
		return result;
	}

	@Override
	public ReservationVO reservationselect(int rsv_number) {
		// TODO Auto-generated method stub
		return reservationDao.reservationselect(rsv_number);
	}

	@Override
	public int selectNum(ReservationVO rvo) {
		return reservationDao.selectNum(rvo);
	}



}
