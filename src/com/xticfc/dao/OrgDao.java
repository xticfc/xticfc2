package com.xticfc.dao;




import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.xticfc.entity.OrgReport;
import com.xticfc.entity.OrgTable;


public class OrgDao extends BaseDao{

	
	/**
	 * 查询所有站点
	 * @param sxid
	 * @param status
	 * @param start
	 * @param size
	 * @param order
	 * @return
	 */
	public List<Map<String,Object>> getOrgTable(String orgId, String status, int start, int size, String order){
		String sql = "select * from orgtable where 1=1 ";
		List<String> param = new ArrayList<String>();
		if(null != orgId && orgId.length() > 0){
			sql += "and id in (select id from orgtable t start with t.id=? ";
			sql += "connect by prior t.id=t.parent)";
			param.add(orgId);
		}
		if(null != status && status.length() > 0){
			sql += " and status = ?";
			param.add(status);
		}
		return super.listByNative(sql, param.toArray(), start, size, order);
	}
	
	public List<OrgTable> list(Integer status, int start, int size, String order){
		String condition = "";
		List<Object> param = new ArrayList<Object>();
		if(null != status){
			condition += "status = ?";
			param.add(status);
		}
		return list(OrgTable.class, condition, param.toArray(), start, size, order);
	}
	
	public int count(Integer status){
		String sql = "select count(*) from orgtable where 1=1";
		List<Object> param = new ArrayList<Object>();
		if(null != status){
			sql += " and status=?";
			param.add(status);
		}
		return jdbcTemplate.queryForObject(sql, param.toArray(), Integer.class);
	}
	
	/**
	 * 查站点个数
	 * @param sxid
	 * @param status
	 * @return
	 */
	public int count(String orgId,String status){
		String sql = "select count(*) from orgtable where 1=1 ";
		List<String> param = new ArrayList<String>();
		if(null != orgId && orgId.length() > 0){
			sql += "and id in (select id from orgtable t start with t.id=? ";
			sql += "connect by prior t.id=t.parent)";
			param.add(orgId);
		}
		if(null != status && status.length() > 0){
			sql += " and status = ?";
			param.add(status);
		}
		return jdbcTemplate.queryForObject(sql, param.toArray(), Integer.class);
	}
	
	/**
	 * 通过orgtable的主键取orgtable
	 * 可能返回null
	 * @param code
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<OrgTable> listByCode(String code){
		String sql = "from OrgTable where id = ?";
		return super.list(sql, new Object[]{code});
	}
	
	/**
	 * 通过一个站点的主键，递归查询出其下属的所有站点信息（包括自己）
	 * @param id
	 * @return
	 */
	public List<Map<String,Object>> getOrgByFunc(String id){
		if(null == id || id.length() == 0){
			return null;
		}
		String sql = " select id,name,shortName,longName,parent,type,zwid ,status from orgtable t ";
		return jdbcTemplate.queryForList(sql, new Object[]{});
	}
	
	/**
	 * 通过一个站点的主键，查出其直接下属的信息
	 * @param id
	 * @param isGetSelf	是否查出自己
	 * @return
	 */
	public List<Map<String,Object>> getSonOrgByFunc(String id, boolean isGetSelf){
		if(null == id || id.length() == 0){
			return null;
		}
		List<Object> param = new ArrayList<Object>();
		String sql = " select id,name,shortName,longName,parent,type,zwid,status " +
				"from orgtable t where t.parent=?";
		param.add(id);
		if(isGetSelf){
			sql += " or t.id=?";
			param.add(id);
		}
		return jdbcTemplate.queryForList(sql, param.toArray());
	}
	
	/**
	 * 通过一个站点主键，查出其有几个直接下属
	 * @param id
	 * @return
	 */
	public int countChildren(String id){
		String hql = "select count(*) from OrgTable where parent=?";
		return super.count(hql, new Object[]{id});
	}

	/**
	 * 删除表与站点表的关系
	 * @param orgid
	 * @param tableInfoCode
	 */
	public void deleteOrgReportRelation(String orgid, String tableInfoCode){
		String sql = "delete from org_report where orgid=? and tableid=?";
		jdbcTemplate.update(sql, new Object[]{orgid, tableInfoCode});
	}
	
	/**
	 * 通过站点主键和报表CODE，查出一条两者的关联关系
	 * @param orgId
	 * @param tableId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public OrgReport getOrgReport(String orgId, String tableId){
		OrgReport orgReport = null;
		String hql = " from OrgReport where orgid=? and tableId=?";
		List<OrgReport> list = super.list(hql, new Object[]{orgId, tableId});
		if(null != list && list.size() > 0){
			orgReport = list.get(0);
		}
		return orgReport;
	}
	
	
	public int updateOrgTable(String parentId, int left){
		int right = left + 1;
		String sql = "select id from orgtable where parent = '" + parentId + "'";
		List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
		Iterator<Map<String,Object>> iter = list.iterator();
		while(iter.hasNext()){
			right = updateOrgTable(iter.next().get("id").toString(), right);
		}
		String updateSql = "update orgtable set lft=" + left +", rgt=" + right + " where id = '" + parentId + "'";
		jdbcTemplate.execute(updateSql);
		
		System.out.println(sql);
		System.out.println(updateSql);
		return right + 1;
	}
	
	
}
