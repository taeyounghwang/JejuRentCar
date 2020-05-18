package com.jeju.client.car.service;
import java.util.List;

import com.jeju.client.car.vo.*;


public interface CarService {
 
 public List<CarVO> carList(CarVO cvo) throws Exception;
 
 
 public CarVO carDetail(CarVO cvo);
 
 

}
