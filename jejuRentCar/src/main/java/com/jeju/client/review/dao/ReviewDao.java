package com.jeju.client.review.dao;

import java.util.List;

import com.jeju.client.review.vo.ReviewVO;

public interface ReviewDao {
	//1.후기 게시글 리스트 출력 
	public List<ReviewVO> review(ReviewVO rvvo);
	//2.후기 게시글 상세 페이지 등록
	public ReviewVO detail(ReviewVO rvvo);
	//3.후기 게시글 등록
	public int revInsert(ReviewVO rvvo);
	//4.후기 게시글 삭제
	public int  reviewDetaildelete(int re_number);
	//5.후기 게시판 전체 레코드 수 구현
	public int listCnt(ReviewVO rvvo);
	
}
