package com.jeju.client.notice.service;

import java.util.List;

import com.jeju.client.notice.vo.NoticeVO;

public interface NoticeService {
	// 공지사항 리스트
	public List<NoticeVO> noticeList(NoticeVO nvo);
	
	// 공지사항 전체 레코드 수 구현
	public int listCnt(NoticeVO nvo);
	
	// 공지사항 상세 페이지 구현
	public NoticeVO detail(int nt_number)throws Exception; 
	
}
