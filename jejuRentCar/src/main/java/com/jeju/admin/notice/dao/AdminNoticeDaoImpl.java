package com.jeju.admin.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.jeju.admin.notice.vo.AdminNoticeVO;

public class AdminNoticeDaoImpl implements AdminNoticeDao {
	
	@Inject
	private SqlSession session;
	
	//1.공지사항 리스트
	@Override
	public List<AdminNoticeVO> NoticeList(AdminNoticeVO vo) {
		
		return session.selectList("NoticeList",vo);
	}
	//1-1.리스트 전체 레코드 수 구현
	@Override
	public int listCnt(AdminNoticeVO vo) {
		return (Integer)session.selectOne("listCnt");
	}
	
	
	//2.공지사항 상세 내역
	@Override
	public AdminNoticeVO detail(int nt_number)throws Exception{
		
		return session.selectOne("detail",nt_number);
	}
	
	//3.공지사항 등록
	@Override
	public int noticeInsert(AdminNoticeVO vo) {
		
		return session.insert("noticeInsert", vo);
	}
	//4.공지사항 수정
	@Override
	public int update(AdminNoticeVO vo) {
	
		return session.update("update",vo);
	}
	
	//5.공지사항 삭제
	public int delete(int nt_number) {
		
		return session.delete("delete", nt_number);
	}
}
