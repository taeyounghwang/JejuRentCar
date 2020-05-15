package com.jeju.admin.car.list.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeju.admin.car.list.vo.AdminCarListVO;

@Repository
public class AdminCarListDaoImpl implements AdminCarListDao {

	@Inject
	SqlSession sqlSession;

	// 차량 등록
	@Override
	public int listInsert(AdminCarListVO vo) {

		return sqlSession.insert("listInsert", vo);
	}

	// 차량 정보 상세 조회
	@Override
	public AdminCarListVO detail(int car_model_number) throws Exception {
		return sqlSession.selectOne("detail", car_model_number);
	}

	// 차량 수정
	@Override
	public int update(AdminCarListVO vo) {
		return sqlSession.update("update", vo);
	}

	// 차량 삭제
	@Override
	public int delete(int car_model_number) {
		return sqlSession.delete("delete", car_model_number);
	}

	// 차량 전체 리스트
	@Override
	public List<AdminCarListVO> list(AdminCarListVO vo) throws Exception {
		return sqlSession.selectList("list", vo);
	}

	//전체 레코드 수 구현
	@Override
	public int carListCnt(AdminCarListVO vo) {
		return (Integer)sqlSession.selectOne("carListCnt");
	}

}
