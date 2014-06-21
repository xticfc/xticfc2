package com.xticfc.dao;

import java.util.List;
import java.util.Map;

import com.xticfc.entity.OrgTable;





@SuppressWarnings("unchecked")
public class TreeDao extends BaseDao{
	
	public List<OrgTable> getChildren(String id){
		String hql = "from OrgTable where parent = ?";
		return super.list(hql, new Object[]{id});
	}
	
	public List<Map<String,Object>> getAllChildren(String id){
		String sql = "select * from ORGTABLE where PARENT="+id;
		return jdbcTemplate.queryForList(sql);
	}
	
	public int countChildren(String id){
		String hql = "select count(*) from OrgTable where parent=?";
		return super.count(hql, new Object[]{id});
	}
	
	public List<OrgTable> getAll(){
		return list(OrgTable.class);
	}
}
