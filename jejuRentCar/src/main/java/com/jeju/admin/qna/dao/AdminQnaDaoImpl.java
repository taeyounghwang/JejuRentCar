package com.jeju.admin.qna.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeju.admin.qna.vo.AdminQnaVO;

@Repository
public class AdminQnaDaoImpl implements AdminQnaDao {

	@Inject
	SqlSession sqlSession;

	// 전체 리스트
	@Override
	public List<AdminQnaVO> list(AdminQnaVO vo) throws Exception {
		return sqlSession.selectList("list", vo);
	}

	// 상세 페이지
	@Override
	public AdminQnaVO detail(int inq_number) throws Exception {
		return sqlSession.selectOne("detail", inq_number);
	}

	// 리스트삭제
	@Override
	public int delete(int inq_number) {
		return sqlSession.delete("delete", inq_number);
	}

	// 댓글 등록, 수정
	@Override
	public int reUpdate(AdminQnaVO vo) {
		return sqlSession.update("reUpdate", vo);
	}

	// 댓글 삭제
	@Override
	public int reDelete(int inq_number) {
		return sqlSession.update("reDelete", inq_number);
	}

	// 전체 레코드 수 구현
	public int qnaListCnt(AdminQnaVO vo) {
		return (Integer) sqlSession.selectOne("qnaListCnt");
	}

}
