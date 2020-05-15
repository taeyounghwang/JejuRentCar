package com.jeju.admin.car.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jeju.admin.car.reservation.vo.AdminCarReservationVO;


public class AdminCarReservationDaoImpl implements AdminCarReservationDao {

	@Autowired
	private SqlSession session;
	
	//1.차량 예약 관리 리스트
	@Override
	public List<AdminCarReservationVO> carResList(AdminCarReservationVO vo) {
		
		return session.selectList("carResList", vo);
	}
	//1-1.차량 예약관리 리스트 전체 레코드
	@Override
	public int listCnt(AdminCarReservationVO vo) {
		return (Integer)session.selectOne("listCnt");
	}
	
	//차량 예약 관리 상세
	@Override
	public AdminCarReservationVO detail(int ren_number)throws Exception{
			
		return session.selectOne("detail",ren_number);
	}
	
	//차량 예약 수정
	@Override
	public int update(AdminCarReservationVO vo) {
			
		return session.update("update",vo);
	}
	
	
	@Override
	public int change(AdminCarReservationVO vo) {
	
	return session.update("change", vo); }
	
	
}
