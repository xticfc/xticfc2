package com.xticfc.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.xticfc.dao.FuncDao;
import com.xticfc.entity.FuncSub;
import com.xticfc.entity.User;

public class FuncService {
	
	FuncDao funcDao;

	/**
	 * 取一个用户的所有权限
	 * @param user
	 * @return
	 */
	public List<Map<String,Object>> getFuncs(User user){
		if(null == user){
			return null;
		}
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		Map<String,Object> resultMap = null;
		Map<String,Object> tempMap;
		List<Map<String,Object>> mainList = funcDao.getFuncMain(user.getUserId());
		if(null != mainList && mainList.size() > 0){
			for(Iterator<Map<String,Object>> iter = mainList.iterator(); iter.hasNext();){
				tempMap = iter.next();
				resultMap = new HashMap<String, Object>();
				resultMap.put("main", tempMap);
				List<Map<String,Object>> subList = funcDao.getFuncSub(tempMap.get("id").toString(), user.getUserId());
				resultMap.put("sub", subList);
				result.add(resultMap);
			}
		}
		
		return result;
	}
	
	public FuncSub get(String id){
		return (FuncSub)funcDao.get(FuncSub.class, id);
	}

	public FuncDao getFuncDao() {
		return funcDao;
	}

	public void setFuncDao(FuncDao funcDao) {
		this.funcDao = funcDao;
	}
	


}
