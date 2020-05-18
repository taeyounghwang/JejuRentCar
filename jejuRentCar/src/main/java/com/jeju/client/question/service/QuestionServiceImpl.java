package com.jeju.client.question.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jeju.admin.common.page.Paging;
import com.jeju.client.question.dao.QuestionDao;
import com.jeju.client.question.vo.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Inject
	private QuestionDao questionDao;
	
	@Override
	public List<QuestionVO> list(QuestionVO qvo) throws Exception {
		List<QuestionVO> list = null;
		
		// 페이징 세팅
		Paging.setPage(qvo);
		
		list = questionDao.list(qvo);
		
		return list;
	}
	
	@Override
	public int qnaListCnt(QuestionVO qvo) {
		return questionDao.qnaListCnt(qvo);
	}

	
	@Override
	public QuestionVO detail(int inq_number) throws Exception {
		return questionDao.detail(inq_number);
	}

	@Override
	public int delete(int inq_number) {
		int result = 0 ;
		
		try {
			result = questionDao.delete(inq_number);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
	}

	@Override
	public int qnaInsert(QuestionVO qvo) {
		return questionDao.qnaInsert(qvo);
	}

	@Override
	public int update(QuestionVO qvo) {
		int result = 0;
		try {
			result = questionDao.update(qvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}
