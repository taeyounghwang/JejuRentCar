package com.jeju.client.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.jeju.client.review.vo.ReviewVO;

public class ReviewDaoImpl implements ReviewDao{
	
	@Inject
	private SqlSession session;

	@Override
	public List<ReviewVO> review(ReviewVO rvvo) {
		return session.selectList("review", rvvo);
	}

	@Override
	public ReviewVO detail(ReviewVO rvvo) {
		return session.selectOne("detail", rvvo);
	}
	
	//3.공지사항 등록
	@Override
	public int revInsert(ReviewVO rvvo) {
		return session.insert("revInsert", rvvo);
	}

	@Override
	public int reviewDetaildelete(int re_number) {
		return session.delete("delete", re_number);
	}
	//전체 레코드 수 구현
	@Override
	public int listCnt(ReviewVO rvvo) {
		return (Integer)session.selectOne("listCnt");
	}

}
