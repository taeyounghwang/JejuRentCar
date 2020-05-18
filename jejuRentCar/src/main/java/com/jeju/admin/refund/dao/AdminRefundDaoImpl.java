package com.jeju.admin.refund.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.admin.refund.vo.AdminRefundVO;

@Repository
public class AdminRefundDaoImpl implements AdminRefundDao {

	@Autowired
	private SqlSession session;

	//1.환불 리스트
	@Override
	public List<AdminRefundVO> refundList(AdminRefundVO vo) {

		return session.selectList("refundList", vo);
	}
	
	//1-1.전체 레코드 수
	@Override
	public int refCnt(AdminRefundVO vo) {
		return (Integer)session.selectOne("refCnt");
	}
	
	//2.환불 상세 내역
	@Override
	public AdminRefundVO detail(int ref_number) {

		return session.selectOne("detail", ref_number);
	}

	//3.환불 상태 변경
	@Override
	public int updateRefund(AdminRefundVO vo) {
		
		return session.update("updateRefund", vo);
	}
	
	//4.회원 예약 내역 업데이트
	@Override
	public int updateReservation(AdminRefundVO vo) {

		return session.update("updateReservation", vo);
	}
	
	//5.차량 예약 내역 업데이트
	@Override
	public int updateCarReservation(AdminRefundVO vo) {
		// TODO Auto-generated method stub
		return session.update("updateCarReservation", vo);
	}


	
}
