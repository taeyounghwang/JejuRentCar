package com.jeju.admin.notice.service;

import java.util.List;

import com.jeju.admin.notice.vo.AdminNoticeVO;

public interface AdminNoticeService {

	//1.공지사항 리스트
	public List<AdminNoticeVO> NoticeList(AdminNoticeVO vo);
	
	//1-1.전체 레코드 수 구현
	public int listCnt(AdminNoticeVO vo);
	
	//2.공지사항 상세 내역
	public AdminNoticeVO detail(int nt_number)throws Exception;
	
	//3.공지사항 등록
	public int noticeInsert(AdminNoticeVO vo);
	
	//4.공지사항 변경 저장
	public int update(AdminNoticeVO vo);
	
	//5.공지사항 삭제
	public int delete(int nt_number);
}
