package com.jeju.client.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeju.client.notice.vo.NoticeVO;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Inject
	private SqlSession session;
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		return session.selectList("noticeList", nvo);
	}

	@Override
	public int listCnt(NoticeVO nvo) {
		return (Integer)session.selectOne("listCnt");
	}

	@Override
	public NoticeVO detailSelect(int nt_number) {
		return session.selectOne("detailSelect", nt_number);
	}

}
