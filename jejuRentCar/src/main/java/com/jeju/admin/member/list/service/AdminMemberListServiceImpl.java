package com.jeju.admin.member.list.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.jeju.admin.common.page.Paging;
import com.jeju.admin.member.list.dao.AdminMemberListDao;
import com.jeju.admin.member.list.vo.AdminMemberListVO;

@Service
public class AdminMemberListServiceImpl implements AdminMemberListService {

	@Inject
	private AdminMemberListDao adminMemberListDao;

	// 회원 상세 조회
	@Override
	public AdminMemberListVO memDetail(String mem_id) throws Exception {
		return adminMemberListDao.memDetail(mem_id);
	}

	// 상태 수정
	@Override
	public int memUpdate(AdminMemberListVO vo) {
		int result = 0;
		try {
			result = adminMemberListDao.memUpdate(vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;

	}

	// 회원 전체 조회
	@Override
	public List<AdminMemberListVO> memList(AdminMemberListVO vo) throws Exception {
		List<AdminMemberListVO> aList = null;

		// 페이지 세팅
		Paging.setPage(vo);

		/*
		 * // 정렬에 대한 기본값 설정 if (vo.getOrder_by() == null) vo.setOrder_by("mem_id"); if
		 * (vo.getOrder_sc() == null) vo.setOrder_sc("ASC");
		 */


		aList = adminMemberListDao.memList(vo);
		return aList;
	}

	// 전체 레코드 수 구현
	@Override
	public int memListCnt(AdminMemberListVO vo) {
		int countNum = 0;
		countNum = adminMemberListDao.memListCnt(vo);
		return countNum;
	}

}
