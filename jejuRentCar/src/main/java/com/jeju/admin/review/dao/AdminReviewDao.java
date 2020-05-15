package com.jeju.admin.review.dao;

import java.util.List;

import com.jeju.admin.review.vo.AdminReviewVO;

public interface AdminReviewDao {

	// 후기 전체 리스트
	public List<AdminReviewVO> list(AdminReviewVO vo) throws Exception;

	// 후기 상세 조회
	public AdminReviewVO detail(int re_number) throws Exception;

	// 후기 리스트 삭제
	public int delete(int re_number);

	// 후기 댓글 등록,수정
	public int reUpdate(AdminReviewVO vo);

	// 후기 댓글 삭제
	public int reDelete(int re_number);

	// 전체 레코드 수 구현
	public int revListCnt(AdminReviewVO vo);
}
