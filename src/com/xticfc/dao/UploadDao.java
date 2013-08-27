package com.xticfc.dao;

import java.util.List;

import com.xticfc.entity.UserReport;



public class UploadDao extends CommonDao{
	
	@SuppressWarnings("unchecked")
	public List<UserReport> list(String userId){
		String sql = " from UserReport where userId = ?";
		return super.list(sql, new Object[]{userId});
	}
}
