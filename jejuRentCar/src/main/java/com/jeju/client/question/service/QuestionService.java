package com.jeju.client.question.service;

import java.util.List;

import com.jeju.client.question.vo.QuestionVO;

public interface QuestionService {
	
	// qna 전체 리스트
	public List<QuestionVO> list(QuestionVO qvo) throws Exception;
	
	// qna 전체 레코드 수 구현
	public int qnaListCnt(QuestionVO qvo);
	
	// qna 상세 조회
	public QuestionVO detail(int inq_number)throws Exception;
	
	// qna 리스트 삭제
	public int delete(int inq_number);
	
	// qna 글 작성
	public int qnaInsert(QuestionVO qvo);
	
	// qna 글 수정
	public int update(QuestionVO qvo);
}
