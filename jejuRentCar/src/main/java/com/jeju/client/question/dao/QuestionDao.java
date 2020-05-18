package com.jeju.client.question.dao;

import java.util.List;

import com.jeju.client.question.vo.QuestionVO;

public interface QuestionDao {

	// qna 전체 리스트
	public List<QuestionVO> list(QuestionVO qvo) throws Exception;
	
	// qna 전체 레코드 수 구현
	public int qnaListCnt(QuestionVO qvo);
	
	// qna 상세 페이지 조회
	public QuestionVO detail(int inq_number) throws Exception;
	
	// qna 게시글 삭제
	public int delete(int inq_number);
	
	// qna 게시글 작성
	public int qnaInsert(QuestionVO qvo);
	
	// qna 게시글 수정
	public int update(QuestionVO qvo);
}
