package com.jeju.admin.car.list.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jeju.admin.car.list.dao.AdminCarListDao;
import com.jeju.admin.car.list.vo.AdminCarListVO;
import com.jeju.admin.common.page.Paging;

@Service
public class AdminCarListServiceImpl implements AdminCarListService {

	@Inject
	private AdminCarListDao adminCarListDao;

	// 차량 등록
	@Override
	public int listInsert(AdminCarListVO vo) {

		int result = 0;
		try {
			result = adminCarListDao.listInsert(vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 차량 정보 상세 조회
	@Override
	public AdminCarListVO detail(int car_model_number) throws Exception {
		return adminCarListDao.detail(car_model_number);
	}

	// 차량 수정
	@Override
	public int update(AdminCarListVO vo) {
		int result = 0;
		try {
			result = adminCarListDao.update(vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;

	}

	// 차량 삭제
	@Override
	public int delete(int car_model_number) {
		int result = 0;
		try {
			result = adminCarListDao.delete(car_model_number);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 차량 전체 리스트
	@Override
	public List<AdminCarListVO> list(AdminCarListVO vo) throws Exception {
		List<AdminCarListVO> aList = null;

		// 페이지 세팅
		Paging.setPage(vo);

		// 정렬에 대한 기본값 설정
		if (vo.getOrder_by() == null)
			vo.setOrder_by("car_model_number");
		if (vo.getOrder_sc() == null)
			vo.setOrder_sc("DESC");

		aList = adminCarListDao.list(vo);
		return aList;
	}

	// 전체 레코드 수 구현
	@Override
	public int carListCnt(AdminCarListVO bvo) {
		int countNum = 0;
		countNum = adminCarListDao.carListCnt(bvo);
		return countNum;
	}
}
