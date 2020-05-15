package com.jeju.admin.refund.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.admin.common.page.Paging;
import com.jeju.admin.refund.dao.AdminRefundDao;
import com.jeju.admin.refund.vo.AdminRefundVO;

@Service
@Transactional
public class AdminRefundServiceImpl implements AdminRefundService {

	@Autowired
	private AdminRefundDao adminRefundDao;

	// 1.환불 리스트
	@Override
	public List<AdminRefundVO> refundList(AdminRefundVO vo) {
		List<AdminRefundVO> list = null;
		// 페이지 세팅
		Paging.setPage(vo);
		
		// 정렬에 대한 기본값 설정
		if (vo.getOrder_by() == null)
			vo.setOrder_by("ref_number");
		if (vo.getOrder_sc() == null)
			vo.setOrder_sc("DESC");
		

		list = adminRefundDao.refundList(vo);

		return list;
	}

	// 1-1.전체 레코드 수
	@Override
	public int refCnt(AdminRefundVO bvo) {
		int countNum = 0;
		countNum = adminRefundDao.refCnt(bvo);
		return countNum;
	}

	// 2.환불 상세 정보
	@Override
	public AdminRefundVO detail(int ref_number) {
		return adminRefundDao.detail(ref_number);
	}

	// 3.환불 상태 변경
	@Override
	public int updateRefund(AdminRefundVO vo) {
		
		int result = 0;
		
		try {
			result = adminRefundDao.updateRefund(vo);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;

	}
	// 4.회원 예약 내역 업데이트
	@Override
	public int updateReservation(AdminRefundVO vo) {
		int result = 0;
		try {
			result = adminRefundDao.updateReservation(vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
