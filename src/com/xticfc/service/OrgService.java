package com.xticfc.service;


import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.xticfc.dao.OrgDao;
import com.xticfc.dao.UserDao;
import com.xticfc.entity.OrgTable;
import com.xticfc.entity.User;
import com.xticfc.util.StringUtil;

public class OrgService extends BaseService{
	
	OrgDao orgDao;
	UserDao userDao;
	
	/**
	 * 分页表数据，不关心是否启用，也不关心是否有权限
	 * @param start
	 * @param size
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<OrgTable> list(String orgId, String status, int start, int size, String order){
		List<Map<String,Object>> list = orgDao.getOrgTable(orgId, status, start, size, order);
		List<OrgTable> result = (List<OrgTable>)StringUtil.mapToList(OrgTable.class, list);
		return result;
	}
	
	
	public int count(Integer status){
		
		return orgDao.count(status);
	}
	public List<OrgTable> list(Integer status, int start, int size, String order){
		return orgDao.list(status, start, size, order);
	}
	
	/**
	 * 统计出系统配置表数据个数，不关心是否启用，也不关心是否有权限
	 * @return
	 */
	public int countOrgTable(){
		return orgDao.count(OrgTable.class);
	}
	/**
	 * 统计出系统配置表数据个数，不关心是否启用，也不关心是否有权限
	 * @return
	 */
	public int countOrgTable(String id,String status){
		return orgDao.count(id,status);
	}
	/**
	 * 通过主键，查出实体
	 * @param id
	 * @return
	 */
	public OrgTable get(String id){
		return (OrgTable)orgDao.get(OrgTable.class, id);
	}

	/**
	 * 通过用户表主键，查询出与其对应的站点表信息
	 * @param userId	用户表的主键
	 * @return	站点表实体类或者null
	 */
	public OrgTable getOrgTableByUserId(String userId){
		User user = (User)userDao.get(User.class, userId);
		OrgTable orgTable = null;
		if(null != user){
			orgTable = (OrgTable)orgDao.get(OrgTable.class, user.getSxId());
		}
		return orgTable;
	}
	
	
	/**
	 * 通过主键查orgTable
	 */
	public OrgTable getOrgTableById(String userId){
		OrgTable orgTable  = (OrgTable)orgDao.get(OrgTable.class, userId);
		return orgTable;
	}
	
	/**
	 * 通过站点主键，查出所有下属的站点（包括自己）
	 * @param id	站点主键
	 * @return
	 */
	public List<Map<String,Object>> getOrgTreeById(String id){
		if(null == id || id.length() == 0){
			return null;
		}
		List<Map<String,Object>> result = orgDao.getOrgByFunc(id);
		
		return result;
	}
	
	/**
	 * 通过一个站点主键，查出其直接下属的信息
	 * @param id
	 * @param isGetSelf	是否查出自己
	 * @return
	 */
	public List<Map<String,Object>> getSonOrgTreeById(String id, boolean isGetSelf){
		if(null == id || id.length() == 0){
			return null;
		}
		List<Map<String,Object>> result = orgDao.getSonOrgByFunc(id, isGetSelf);
		if(null != result && result.size() > 0){
			Map<String,Object> map;
			int count = 0;
			for(Iterator<Map<String,Object>> iter = result.iterator(); iter.hasNext();){
				map = iter.next();
				count = orgDao.countChildren(map.get("id").toString());
				if(count > 0){
					map.put("isParent", true);
				}else{
					map.put("isParent", false);
				}
			}
		}
		return result;
	}
	
	
	
	public void deleteOrg(String id) {
		 orgDao.delete(OrgTable.class,id);
		
	}
	
	public void updateOrgTable(){
		orgDao.updateOrgTable("000000", 1);
	}
	
	
	public OrgDao getOrgDao() {
		return orgDao;
	}

	public void setOrgDao(OrgDao orgDao) {
		this.orgDao = orgDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
