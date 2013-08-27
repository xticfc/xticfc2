package com.xticfc.dao;

import java.util.List;





public class DinnerDao extends CommonDao{
	
	@SuppressWarnings("unchecked")
	public List list(String sql, Object... param){
		return super.list(sql, param);
	}
	public void deleteAll(String sql, Object[] params){
		execteNativeBulk(sql, params);
	}
}
