package com.jeju.client.reservation.dao;

import com.jeju.client.reservation.vo.ReservationVO;

public interface ReservationDao {
	

public ReservationVO Reservation(ReservationVO RVO);

public int ReservationInsert(ReservationVO RVO);

public ReservationVO reservationselect(int rsv_number);

public int selectNum(ReservationVO rvo);
}
