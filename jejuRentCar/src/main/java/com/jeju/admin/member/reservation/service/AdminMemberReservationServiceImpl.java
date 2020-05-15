package com.jeju.admin.member.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.admin.common.page.Paging;
import com.jeju.admin.member.reservation.dao.AdminMemberReservationDao;
import com.jeju.admin.member.reservation.vo.AdminMemberReservationVO;

@Service
@Transactional
public class AdminMemberReservationServiceImpl implements AdminMemberReservationService {

	@Autowired
	private AdminMemberReservationDao adminMemberReservationDao;

	// 회원 예약 내역 리스트
	@Override
	public List<AdminMemberReservationVO> memResList(AdminMemberReservationVO vo) throws Exception {
		List<AdminMemberReservationVO> aList = null;

		// 페이지 세팅
		Paging.setPage(vo);

		// 정렬에 대한 기본값 설정
		if (vo.getOrder_by() == null)
			vo.setOrder_by("rsv_number");
		if (vo.getOrder_sc() == null)
			vo.setOrder_sc("DESC");

		aList = adminMemberReservationDao.memResList(vo);
		return aList;
	}

	// 회원 예약 내역 상세 정보
	@Override
	public AdminMemberReservationVO detail(int rsv_number) throws Exception {
		return adminMemberReservationDao.detail(rsv_number);
	}

	// 회원 예약 상태 변경 저장
	@Override
	public int update(AdminMemberReservationVO vo) {
		int result = 0;
		try {
			result = adminMemberReservationDao.update(vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;

	}

	// 전체 레코드 수 구현
	@Override
	public int memResListCnt(AdminMemberReservationVO vo) {
		int countNum = 0;
		countNum = adminMemberReservationDao.memResListCnt(vo);
		return countNum;
	}

	// 차량 예약 관리로 인설트
	@Override
	public int insert(AdminMemberReservationVO vo) {

		int result = 0;
		try {
			result = adminMemberReservationDao.insert(vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	//1월 매출액
	@Override
	public AdminMemberReservationVO selectJan(AdminMemberReservationVO rvo) {
		
		return adminMemberReservationDao.selectJan(rvo);
	}
	
	//1월 예약건수
	@Override
	public int selectJanCnt(AdminMemberReservationVO rvo) {
		int total = 0;
		total = adminMemberReservationDao.selectJanCnt(rvo);
		return total;
	}
	
	//2월 매출액
	@Override
	public AdminMemberReservationVO selectFeb(AdminMemberReservationVO rvo) {
		
		return adminMemberReservationDao.selectFeb(rvo);
	}
	//2월 예약건수
	@Override
	public int selectFebCnt(AdminMemberReservationVO rvo) {
		int total = 0;
		total = adminMemberReservationDao.selectFebCnt(rvo);
		return total;
	}
	//3월 매출액
	@Override
	public AdminMemberReservationVO selectMar(AdminMemberReservationVO rvo) {
		
		return adminMemberReservationDao.selectMar(rvo);
	}
	//3월 예약건수
	@Override
	public int selectMarCnt(AdminMemberReservationVO rvo) {
		int total = 0;
		total = adminMemberReservationDao.selectMarCnt(rvo);
		return total;
	}
	//4월 매출액
	@Override
	public AdminMemberReservationVO selectApr(AdminMemberReservationVO rvo) {

		return adminMemberReservationDao.selectApr(rvo);
	}
	//4월 예약건수
	@Override
	public int selectAprCnt(AdminMemberReservationVO rvo) {
		int total = 0;
		total = adminMemberReservationDao.selectAprCnt(rvo);
		return total;
	}
	//5월 매출액
	@Override
	public AdminMemberReservationVO selectMay(AdminMemberReservationVO rvo) {
		return adminMemberReservationDao.selectMay(rvo);
	}
	//5월 예약건수
	@Override
	public int selectMayCnt(AdminMemberReservationVO rvo) {
		int total = 0;
		total = adminMemberReservationDao.selectMayCnt(rvo);
		return total;
	}
	//6월 매출액
	@Override
	public AdminMemberReservationVO selectJun(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return adminMemberReservationDao.selectJun(rvo);
	}
	//6월 예약건수
	@Override
	public int selectJunCnt(AdminMemberReservationVO rvo) {
		int total = 0;
		total = adminMemberReservationDao.selectJunCnt(rvo);
		return total;
	}
	//7월 매출액
	@Override
	public AdminMemberReservationVO selectJul(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return adminMemberReservationDao.selectJul(rvo);
	}
	//7월 예약건수
	@Override
	public int selectJulCnt(AdminMemberReservationVO rvo) {
		int total = 0;
		total = adminMemberReservationDao.selectJulCnt(rvo);
		return total;
	}
	//8월 매출액
	@Override
	public AdminMemberReservationVO selectAug(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return adminMemberReservationDao.selectAug(rvo);
	}
	//8월 예약건수
	@Override
	public int selectAugCnt(AdminMemberReservationVO rvo) {
		int total = 0;
		total = adminMemberReservationDao.selectAugCnt(rvo);
		return total;
	}
	//9월 매출액
	@Override
	public AdminMemberReservationVO selectSept(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return adminMemberReservationDao.selectSept(rvo);
	}
	//9월 예약건수
	@Override
	public int selectSeptCnt(AdminMemberReservationVO rvo) {
		int total = 0;
		total = adminMemberReservationDao.selectSeptCnt(rvo);
		return total;
	}
	//10월 매출액
	@Override
	public AdminMemberReservationVO selectOct(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return adminMemberReservationDao.selectOct(rvo);
	}
	//10월 예약건수
	@Override
	public int selectOctCnt(AdminMemberReservationVO rvo) {
		int total = 0;
		total = adminMemberReservationDao.selectOctCnt(rvo);
		return total;
	}
	//11월 매출액
	@Override
	public AdminMemberReservationVO selectNov(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return adminMemberReservationDao.selectNov(rvo);
	}
	//11월 예약건수
	@Override
	public int selectNovCnt(AdminMemberReservationVO rvo) {
		int total = 0;
		total = adminMemberReservationDao.selectNovCnt(rvo);
		return total;
	}
	//12월 매출액
	@Override
	public AdminMemberReservationVO selectDec(AdminMemberReservationVO rvo) {
		// TODO Auto-generated method stub
		return adminMemberReservationDao.selectDec(rvo);
	}
	//12월 예약건수
	@Override
	public int selectDecCnt(AdminMemberReservationVO rvo) {
		int total = 0;
		total = adminMemberReservationDao.selectDecCnt(rvo);
		return total;
	}

	

}
