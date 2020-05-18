package com.jeju.client.car.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.client.car.vo.CarVO;

@Repository
public class CarDaoImpl implements CarDao {
	
	@Autowired
	private SqlSession session;
	
	//01.  차량 리스트
	@Override
	public List<CarVO> carList(CarVO cvo)  throws Exception{
		return session.selectList("carList",cvo);
	}

	@Override
	public CarVO carDetail(CarVO cvo) {
		return session.selectOne("carDetail",cvo);
	}


	


		
	
}
