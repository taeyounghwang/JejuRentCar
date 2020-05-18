package com.jeju.client.reservation.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.client.reservation.vo.ReservationVO;

@Repository
public class ReservationDaoImpl implements ReservationDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public ReservationVO Reservation(ReservationVO RVO) {
		return session.selectOne("Reservation",RVO);
	}

	@Override
	public int ReservationInsert(ReservationVO RVO) {
		return session.insert("ReservationInsert", RVO);
	}

	@Override
	public ReservationVO reservationselect(int rsv_number) {
		// TODO Auto-generated method stub
		return session.selectOne("reservationselect", rsv_number);
	}

	@Override
	public int selectNum(ReservationVO rvo) {
		return session.selectOne("selectNum",rvo);
	}




	
}
