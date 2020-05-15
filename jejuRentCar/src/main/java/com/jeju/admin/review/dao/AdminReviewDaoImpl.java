package com.jeju.admin.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeju.admin.review.vo.AdminReviewVO;

@Repository
public class AdminReviewDaoImpl implements AdminReviewDao {

	@Inject
	SqlSession sqlSession;

	// 후기 전체 리스트
	@Override
	public List<AdminReviewVO> list(AdminReviewVO vo) throws Exception {
		return sqlSession.selectList("list", vo);
	}

	// 후기 상세 페이지
	@Override
	public AdminReviewVO detail(int re_number) throws Exception {
		return sqlSession.selectOne("detail", re_number);
	}

	// 후기 삭제
	@Override
	public int delete(int re_number) {
		return sqlSession.delete("delete", re_number);
	}

	// 댓글 등록, 수정
	@Override
	public int reUpdate(AdminReviewVO vo) {
		return sqlSession.update("reUpdate", vo);
	}

	// 댓글 삭제
	@Override
	public int reDelete(int re_number) {
		return sqlSession.update("reDelete", re_number);
	}

	// 전체 레코드 수 구현
	@Override
	public int revListCnt(AdminReviewVO vo) {
		return (Integer) sqlSession.selectOne("revListCnt");
	}

}
