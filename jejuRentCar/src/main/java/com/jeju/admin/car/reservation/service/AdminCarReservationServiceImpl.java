package com.jeju.admin.car.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.admin.car.reservation.dao.AdminCarReservationDao;
import com.jeju.admin.car.reservation.vo.AdminCarReservationVO;
import com.jeju.admin.common.page.Paging;

@Service
@Transactional
public class AdminCarReservationServiceImpl implements AdminCarReservationService {

	@Autowired
	private AdminCarReservationDao adminCarReservationDao;

	// 1.차량 예약 관리 리스트
	@Override
	public List<AdminCarReservationVO> carResList(AdminCarReservationVO vo) {
		List<AdminCarReservationVO> list = null;

		// 페이지 세팅
		Paging.setPage(vo);

		// 정렬에 대한 기본값 설정
		if (vo.getOrder_by() == null)
			vo.setOrder_by("REN_NUMBER");
		if (vo.getOrder_sc() == null)
			vo.setOrder_sc("DESC");

		list = adminCarReservationDao.carResList(vo);

		return list;
	}

	// 1-1.전체 레코드 수 구현
	@Override
	public int listCnt(AdminCarReservationVO bvo) {
		int countNum = 0;
		countNum = adminCarReservationDao.listCnt(bvo);
		return countNum;
	}

	// 차량 예약 관리 상세 내역
	@Override
	public AdminCarReservationVO detail(int ren_number) throws Exception {
		return adminCarReservationDao.detail(ren_number);
	}

	// 차량 예약 상태 변경 저장
	@Override
	public int update(AdminCarReservationVO vo) {
		int result = 0;
		try {
			result = adminCarReservationDao.update(vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 차량 예약 상태 변경 시 회원 예약 내역에 업데이트
	@Override
	public int change(AdminCarReservationVO vo) {

		int result = 0;
		try {
			result = adminCarReservationDao.change(vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;

	}

}
