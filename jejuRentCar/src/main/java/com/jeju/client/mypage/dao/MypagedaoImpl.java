package com.jeju.client.mypage.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.jeju.client.member.vo.MemberVO;
import com.jeju.client.reservation.vo.ReservationVO;


public class MypagedaoImpl implements MypageDao{

	@Inject
	private SqlSession session;
	
	@Override
	public List<ReservationVO> reservation(ReservationVO rvo) {
		System.out.println(rvo.getCar_name() + "Dao IMPL");
		return session.selectList("reservation",rvo);
	}

	@Override
	public ReservationVO reservationdetail(ReservationVO rvo) {
		return session.selectOne("reservationdetail",rvo);
	}

	@Override
	public MemberVO pwChk(MemberVO mvo) {
		return session.selectOne("pwChk", mvo);
	}

	@Override
	public String selectHash(String mem_id) {
		return session.selectOne("selectHash", mem_id);
	}

	@Override
	public int rescancel(ReservationVO rvo) {
		return session.update("rescancel", rvo);
	}
	
	@Override
	public int refrequest(ReservationVO rvo) {
		return session.update("refrequest", rvo);
	}

	@Override
	public int infoUpdate(MemberVO mvo) {
		return session.update("infoUpdate", mvo);
	}
}
