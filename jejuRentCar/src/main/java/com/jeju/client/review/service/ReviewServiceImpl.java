package com.jeju.client.review.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.admin.common.page.Paging;
import com.jeju.client.review.dao.ReviewDao;
import com.jeju.client.review.vo.ReviewVO;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDao ReviewDao;
	
	@Inject
	private ReviewDao dao;
	//2.후기 디테일 
	@Override
	public ReviewVO detail(ReviewVO rvvo) {
		return dao.detail(rvvo);
	}

	// 3.후기 등록
	@Override
	public int revInsert(ReviewVO rvvo) {

	int result = 0;
	try {
			result = ReviewDao.revInsert(rvvo);
	} catch (Exception e) {
		e.printStackTrace();
		result = 0;
		}
		return result;
	}
		//4.후기 게시글 삭재
		@Override
		public int reviewDetaildelete(int re_number) {
			int result = 0;
			
			
			result = ReviewDao.reviewDetaildelete(re_number);
			
			
			return result;
		}
		@Override
		public List<ReviewVO> review(ReviewVO rvvo) {
			List<ReviewVO> list = null;

			// 페이지 세팅
			Paging.setPage(rvvo);

			list = ReviewDao.review(rvvo);
			return list;
		}

		@Override
		public int listCnt(ReviewVO rvvo) {
			int countNum = 0;
			countNum = ReviewDao.listCnt(rvvo);
			return countNum;
		}


}
