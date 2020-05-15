package com.jeju.admin.member.reservation.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeju.admin.member.reservation.vo.AdminMemberReservationVO;

@Repository
public class AdminMemberReservationDaoImpl implements AdminMemberReservationDao {

	@Inject
	private SqlSession session;

	// 회원 예약 리스트 구현
	@Override
	public List<AdminMemberReservationVO> memResList(AdminMemberReservationVO vo) throws Exception {

		return session.selectList("memResList", vo);
	}

	// 차량 정보 상세 조회
	@Override
	public AdminMemberReservationVO detail(int rsv_number) throws Exception {

		return session.selectOne("detail", rsv_number);
	}

	// 차량 수정
	@Override
	public int update(AdminMemberReservationVO vo) {

		return session.update("update", vo);
	}

	// 전체 레코드 수 구현
	@Override
	public int memResListCnt(AdminMemberReservationVO vo) {
		return (Integer) session.selectOne("memResListCnt");
	}

	// 차량 예약 관리 인설트
	@Override
	public int insert(AdminMemberReservationVO vo) {

		return session.insert("insert", vo);
	}

	// 1월 매출액
	@Override
	public AdminMemberReservationVO selectJan(AdminMemberReservationVO rvo) {

		return session.selectOne("selectJan", rvo);
	}
	// 1월 예약건수
	@Override
	public int selectJanCnt(AdminMemberReservationVO rvo) {

		return (Integer) session.selectOne("selectJanCnt");
	}
	//2월 매출액
	@Override
	public AdminMemberReservationVO selectFeb(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}
	//2월 예약건수
	@Override
	public int selectFebCnt(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//3월 매출액
	@Override
	public AdminMemberReservationVO selectMar(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}
	//3월 예약건수
	@Override
	public int selectMarCnt(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//4월 매출액
	@Override
	public AdminMemberReservationVO selectApr(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}
	//4월 예약건수
	@Override
	public int selectAprCnt(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	// 5월 매출액
	@Override
	public AdminMemberReservationVO selectMay(AdminMemberReservationVO rvo) {

		return session.selectOne("selectMay", rvo);
	}
	// 5월 예약건수
	@Override
	public int selectMayCnt(AdminMemberReservationVO rvo) {

		return (Integer) session.selectOne("selectMayCnt");
	}
	//6월 매출액
	@Override
	public AdminMemberReservationVO selectJun(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}
	//6월 예약건수
	@Override
	public int selectJunCnt(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//7월 매출액
	@Override
	public AdminMemberReservationVO selectJul(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}
	//7월 예약건수
	@Override
	public int selectJulCnt(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//8월 매출액
	@Override
	public AdminMemberReservationVO selectAug(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}
	//8월 예약건수
	@Override
	public int selectAugCnt(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//9월 매출액
	@Override
	public AdminMemberReservationVO selectSept(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}
	//9월 예약건수
	@Override
	public int selectSeptCnt(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//10월 매출액
	@Override
	public AdminMemberReservationVO selectOct(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}
	//10월 예약건수
	@Override
	public int selectOctCnt(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//11월 매출액
	@Override
	public AdminMemberReservationVO selectNov(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}
	//11월 예약건수
	@Override
	public int selectNovCnt(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//12월 매출액
	@Override
	public AdminMemberReservationVO selectDec(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}
	//12월 예약건수
	@Override
	public int selectDecCnt(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
