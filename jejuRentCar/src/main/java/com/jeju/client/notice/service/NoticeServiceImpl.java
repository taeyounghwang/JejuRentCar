package com.jeju.client.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jeju.admin.common.page.Paging;
import com.jeju.client.notice.dao.NoticeDao;
import com.jeju.client.notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDao noticeDao;
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> list = null;

		// 페이지 세팅
		Paging.setPage(nvo);

		list = noticeDao.noticeList(nvo);
		return list;
	}

	@Override
	public int listCnt(NoticeVO nvo) {
		int countNum = 0;
		countNum = noticeDao.listCnt(nvo);
		return countNum;
	}

	@Override
	public NoticeVO detail(int nt_number) throws Exception {
		return noticeDao.detailSelect(nt_number);
	}

}
