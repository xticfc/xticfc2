package com.xticfc.dao;

import java.util.List;
import java.util.Map;

import com.xticfc.util.Constants;




public class FuncDao extends BaseDao{
	
	
	/**
	 * 取用户的主权限
	 * @param userId
	 * @return
	 */
	public List<Map<String,Object>> getFuncMain(String userId){
		if(null == userId || userId.length() == 0){
			return null;
		}
		String sql = "select * from Func_Main where id in " +
				"(select distinct funcmainid from func_sub where funcid in " +
				"(select funcid from funcuser where userid=?) and status=?)";
		return super.jdbcTemplate.queryForList(sql, new Object[]{userId, Constants.STATUS_YES});
	}
	
	/**
	 * 取用户的子权限
	 * @param mainId
	 * @param userId
	 * @return
	 */
	public List<Map<String,Object>> getFuncSub(String mainId, String userId){
		if(null == userId || userId.length() ==0 || null == mainId || mainId.length() == 0){
			return null;
		}
		String sql = "select * from func_sub where status=?" +
				" and funcmainid=? and funcid in " +
				"(select funcid from funcuser where userid=?) order by ordercode";
		return super.jdbcTemplate.queryForList(sql, new Object[]{Constants.STATUS_YES, mainId, userId});
	}
}
