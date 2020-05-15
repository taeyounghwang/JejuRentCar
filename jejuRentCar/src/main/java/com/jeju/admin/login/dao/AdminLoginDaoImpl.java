package com.jeju.admin.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.admin.login.vo.AdminLoginVO;


@Repository
public class AdminLoginDaoImpl implements AdminLoginDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 로그인 체크
	@Override
	public AdminLoginVO loginCheck(AdminLoginVO lvo) { // 관리자 테이블을 select 조회한 결과를 리턴
		return sqlSession.selectOne("loginCheck", lvo);
	}

}
