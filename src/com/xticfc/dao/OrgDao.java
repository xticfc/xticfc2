package com.xticfc.dao;




import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.xticfc.entity.OrgReport;
import com.xticfc.entity.OrgSysTable;
import com.xticfc.entity.OrgTable;


public class OrgDao extends CommonDao{

	
	@SuppressWarnings("unchecked")
	public List<OrgTable> getZdmc(String tbdwid) {
		String sql = "from OrgTable where id = '"+tbdwid+"'";
		
		return super.list(sql, new Object[]{});
	}
	/**
	 * 查询所有站点
	 * @param sxid
	 * @param status
	 * @param start
	 * @param size
	 * @param order
	 * @return
	 */
	@SuppressWarnings("unchecked")
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
	/**
	 * 查站点个数
	 * @param sxid
	 * @param status
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public int count(String orgId,String status){
		String sql = "select count(id) from orgtable where 1=1 ";
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
		return jdbcTemplate.queryForInt(sql, param.toArray());
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
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> getOrgByFunc(String id){
		if(null == id || id.length() == 0){
			return null;
		}
		String sql = " select id,name,shortName,longName,parent,type,zwid ,status from orgtable t start with t.id=? connect by prior t.id=t.parent";
		return jdbcTemplate.queryForList(sql, new Object[]{id});
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
		String hql = "select count(id) from OrgTable where parent=?";
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
	
	/**
	 * 删除系统与站点表的关系
	 * @param orgid
	 * @param systableid
	 */
	public void deleteOrgSysTBRelation(String orgid, String systableid){
		String sql = "delete from org_systable where orgid=? and systableid=?";
		jdbcTemplate.update(sql, new Object[]{orgid, systableid});
	}
	
	/**
	 * 通过站点主键和系统主键查出关联关系
	 * @param orgId
	 * @param systableId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public OrgSysTable getOrgSysTable(String orgId, String systableId){
		OrgSysTable orgSysTable = null;
		String hql = " from OrgSysTable where orgid=? and systableid=?";
		List<OrgSysTable> list = super.list(hql, new Object[]{orgId, systableId});
		if(null != list && list.size() > 0){
			orgSysTable = list.get(0);
		}
		return orgSysTable;
	}

	/**
	 * 查表与站点表的关系
	 * @param orgid
	 * @param tableInfoCode
	 */
	public int findOrgReportRelation(String orgid, String tableInfoCode){
		String sql = "select count(*) from org_report where orgid=? and tableid=?";
		return jdbcTemplate.queryForInt(sql, new Object[]{orgid, tableInfoCode});
	}
	
	/**
	 * 查系统与站点表的关系
	 * @param orgid
	 * @param tableInfoCode
	 */
	public int findOrgSysTBRelation(String orgid, String systableid){
		String sql = "select count(*) from org_systable where orgid=? and systableid=?";
		return jdbcTemplate.queryForInt(sql, new Object[]{orgid, systableid});
	}
	@SuppressWarnings("unchecked")
	public List<OrgTable> getsiteRelationList(String sxid,
			int start, int size, String order) {
		String cond = "1=1";
		List<Object> param = new ArrayList<Object>();
		if(sxid != null && sxid.length() > 0){
			cond += " and id =? ";
			param.add(sxid);
		}
		return super.list(OrgTable.class,cond, param.toArray(), start, size, order);
	}
	public int countsiteRelationList(String sxid) {
		String hql = " select count(*) from OrgTable where 1=1 ";
		List<Object> param = new ArrayList<Object>();
		if(sxid != null && sxid.length() > 0){
			hql += " and id =?";
			param.add(sxid);
		}
		return super.count(hql, param.toArray());
	}
	public void delete(String sxid, String inputvalue,String systemid) {
		String hql = " delete   from TransCityCode where selfCode=? and systemId=? ";
		List<Object> param = new ArrayList<Object>();
		param.add(sxid);
		param.add(systemid);
		super.delete(hql, param.toArray());
	}
	
	
	public void updateS(String sxid, String inputvalue,String systemid) {
		String hql = " update    trans_city_code1 set othercode=?  where   selfcode=? and systemid=?  ";
		List<Object> param = new ArrayList<Object>();
		param.add(inputvalue);
		param.add(sxid);
		param.add(systemid);
		jdbcTemplate.update(hql, param.toArray());
	}
	
	
}
