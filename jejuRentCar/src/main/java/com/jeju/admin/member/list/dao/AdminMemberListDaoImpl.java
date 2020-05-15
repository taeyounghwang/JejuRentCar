package com.jeju.admin.member.list.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeju.admin.member.list.vo.AdminMemberListVO;

@Repository
public class AdminMemberListDaoImpl implements AdminMemberListDao {

	@Inject
	private SqlSession sqlsession;

	// 회원 리스트 상세 조회
	@Override
	public AdminMemberListVO memDetail(String mem_id) throws Exception {
		return sqlsession.selectOne("memDetail", mem_id);
	}

	// 상태 수정
	@Override
	public int memUpdate(AdminMemberListVO vo) {
		return sqlsession.update("memUpdate",vo);
	}

	// 회원 리스트 전체 조회
	@Override
	public List<AdminMemberListVO> memList(AdminMemberListVO vo) throws Exception {
		return sqlsession.selectList("memList", vo);
	}

	//전체 레코드 수 구현
	@Override
	public int memListCnt(AdminMemberListVO vo) {
		return (Integer)sqlsession.selectOne("memListCnt");
	}

}
