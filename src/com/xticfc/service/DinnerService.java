package com.xticfc.service;


import java.util.List;

import com.xticfc.dao.DinnerDao;
import com.xticfc.entity.Dinner;



public class DinnerService extends BaseService{

	DinnerDao dinnerDao;
	
	
	public List<Dinner> list(int start, int size, String order){
		return dinnerDao.list(Dinner.class, start, size, order);
	}
	
	public int count(){
		return dinnerDao.count(Dinner.class);
	}
	
	
	
	

	public DinnerDao getDinnerDao() {
		return dinnerDao;
	}

	public void setDinnerDao(DinnerDao dinnerDao) {
		this.dinnerDao = dinnerDao;
	}
	
}
