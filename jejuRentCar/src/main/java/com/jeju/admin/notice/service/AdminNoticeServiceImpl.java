package com.jeju.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.admin.common.page.Paging;
import com.jeju.admin.notice.dao.AdminNoticeDao;
import com.jeju.admin.notice.vo.AdminNoticeVO;

@Service
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	private AdminNoticeDao adminNoticeDao;

	// 1.공지사항 리스트
	@Override
	public List<AdminNoticeVO> NoticeList(AdminNoticeVO vo) {
		List<AdminNoticeVO> list = null;

		// 페이지 세팅
		Paging.setPage(vo);

		// 정렬에 대한 기본값 설정
		if (vo.getOrder_by() == null)
			vo.setOrder_by("NT_NUMBER");
		if (vo.getOrder_sc() == null)
			vo.setOrder_sc("DESC");

		list = adminNoticeDao.NoticeList(vo);
		return list;

	}

	// 전체 레코드 수 구현
	@Override
	public int listCnt(AdminNoticeVO bvo) {
		int countNum = 0;
		countNum = adminNoticeDao.listCnt(bvo);
		return countNum;
	}

	// 2.공지사항 상세 내역
	@Override
	public AdminNoticeVO detail(int nt_number) throws Exception {
		return adminNoticeDao.detail(nt_number);
	}

	// 3.공지사항 등록
	@Override
	public int noticeInsert(AdminNoticeVO vo) {

		int result = 0;
		try {
			result = adminNoticeDao.noticeInsert(vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 4.공지사항 변경 저장
	@Override
	public int update(AdminNoticeVO vo) {
		int result = 0;
		try {
			result = adminNoticeDao.update(vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;

	}

	// 5.공지사항 삭제
	@Override
	public int delete(int nt_number) {
		int result = 0;
		try {
			result = adminNoticeDao.delete(nt_number);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
}
