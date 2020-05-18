package com.jeju.client.notice.dao;

import java.util.List;

import com.jeju.client.notice.vo.NoticeVO;

public interface NoticeDao {
	// 공지사항 리스트 구현
	public List<NoticeVO> noticeList(NoticeVO nvo);
	// 공지사항 전체 레코드 수 구현
	public int listCnt(NoticeVO nvo);
	// 공지사항 상세 페이지 구현
	public NoticeVO detailSelect(int nt_number);
}
