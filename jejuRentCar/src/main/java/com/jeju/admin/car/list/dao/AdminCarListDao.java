package com.jeju.admin.car.list.dao;

import java.util.List;

import com.jeju.admin.car.list.vo.AdminCarListVO;

public interface AdminCarListDao {

	// 차량 등록
	public int listInsert(AdminCarListVO vo);

	// 차량 상세 정보
	public AdminCarListVO detail(int car_model_number) throws Exception;

	// 차량 수정
	public int update(AdminCarListVO vo);

	// 차량 삭제
	public int delete(int car_model_number);

	// 리스트 전체 목록
	public List<AdminCarListVO> list(AdminCarListVO vo) throws Exception;

	//전체 레코드 수 구현
	public int carListCnt(AdminCarListVO vo);
}
