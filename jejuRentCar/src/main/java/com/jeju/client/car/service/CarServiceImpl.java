package com.jeju.client.car.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.client.car.dao.CarDao;
import com.jeju.client.car.vo.CarVO;

@Service
@Transactional
public class CarServiceImpl implements CarService{

	@Autowired
	private CarDao carDao;
	
	// 카 서비스에서 상속 받은 클래스에서 재정의 한 carList메소드 리턴 값은 리스트<carVO>**리스트를 쓰는 이유 블라블라 리턴값은
	@Override
	public List<CarVO> carList(CarVO cvo) throws Exception{
		return carDao.carList(cvo);
		
	}

	@Override
	public CarVO carDetail(CarVO cvo) {
		return carDao.carDetail(cvo);
	
	}


}
