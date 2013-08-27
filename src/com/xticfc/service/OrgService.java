package com.xticfc.service;


import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.xticfc.dao.OrgDao;
import com.xticfc.dao.UserDao;
import com.xticfc.entity.OrgReport;
import com.xticfc.entity.OrgSysTable;
import com.xticfc.entity.OrgTable;
import com.xticfc.entity.User;
import com.xticfc.util.StringUtil;

public class OrgService {
	
	OrgDao orgDao;
	UserDao userDao;
	
	public String getZdmc(String tbdwid){
		List<OrgTable> orglist = orgDao.getZdmc(tbdwid);
		OrgTable org=orglist.get(0);
		return org.getShortName();
	}
	
	/**
	 * 分页表数据，不关心是否启用，也不关心是否有权限
	 * @param start
	 * @param size
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<OrgTable> list(String orgId, String status, int start, int size, String order){
		List<Map<String,Object>> list = orgDao.getOrgTable(orgId, status, start, size, order);
		List<OrgTable> result = StringUtil.mapToList(OrgTable.class, list);
		return result;
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
	 * 验证站点表是否相同,按照ordercode字段排序，按照code,name,remark,ordercode的排列顺序效验，不效验主键。
	 * @param mobileLogin
	 * @param md5
	 * @return
	 */
	
	/**
	 * 验证作物表是否相同,按照ordercode字段排序，按照code,name,remark,ordercode的排列顺序效验，不效验主键。
	 * 如果效验不一样，把服务器上的数据传给前台。
	 * @param mobileLogin
	 * @param md5
	 * @return
	 */

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
	/**
	 * 选择报表
	 * @param orgId
	 * @param userId
	 * @param longName
	 * @param start
	 * @param size
	 * @param order
	 * @return
	 */
	
	
	
	
	/**
	 * 更新报表与站点关系表
	 * @param orgId
	 * @param checked
	 * @param notChecked
	 */
	public void updateCheckRelation(String orgId, String checked, String canceledList){
		if(StringUtil.isNullOrSpace(orgId)){
			return ;
		}
		
		if(!StringUtil.isNullOrSpace(canceledList)){
			String[] canceledArray = canceledList.split(",");
			if(canceledArray.length > 0){
				for(int i=0; i<canceledArray.length; i++){
					orgDao.deleteOrgReportRelation(orgId, canceledArray[i]);
				}
			}
		}
		if(!StringUtil.isNullOrSpace(checked)){
			String[] checkedArray = checked.split(",");
			OrgReport orgReport;
			if(null != checkedArray && checkedArray.length > 0){
				for(int j=0; j<checkedArray.length; j++){
					orgReport = orgDao.getOrgReport(orgId,checkedArray[j]);
					if(null == orgReport){
						orgReport = new OrgReport();
						orgReport.setOrgid(orgId);
						orgReport.setTableId(checkedArray[j]);
						orgDao.save(orgReport);
					}
				}
			}
		}
		
	}
	
	
	
	
	/**
	 * 更新系统与站点关系表
	 * @param orgId
	 * @param checkedList
	 * @param canceledList
	 */
	public void updatergSysTBRelation(String orgId, String checkedList, String canceledList){
		if(StringUtil.isNullOrSpace(orgId)){
			return ;
		}
		if(!StringUtil.isNullOrSpace(canceledList)){
			String[] canceledArray = canceledList.split(",");
			for(int i=0; i<canceledArray.length; i++){
				orgDao.deleteOrgSysTBRelation(orgId, canceledArray[i]);
			}
		}
		if(!StringUtil.isNullOrSpace(checkedList)){
			String[] checkedArray = checkedList.split(",");
			OrgSysTable orgSysTable = null;
			for(int j=0; j<checkedArray.length; j++){
				orgSysTable = orgDao.getOrgSysTable(orgId, checkedArray[j]);
				if(null==orgSysTable){
					orgSysTable = new OrgSysTable();
					orgSysTable.setOrgid(orgId);
					orgSysTable.setSystableid(checkedArray[j]);
					orgDao.save(orgSysTable);
				}
			}
		}
		
	}
	
	public List<OrgTable> siteRelationList(String sxid,
			int start, int size, String order) {
			List<OrgTable> sitRelationList = orgDao.getsiteRelationList(sxid, start, size, order);
			return sitRelationList;
	}
	
	public int countsiteRelationList(String  sxid) {
		return orgDao.countsiteRelationList(sxid);
	}
	
	public void delete(String sxid, String inputvalue,String systemid) {
		 orgDao.delete(sxid,inputvalue,systemid);
		
	}
	
	public void deleteOrg(String id) {
		 orgDao.delete(OrgTable.class,id);
		
	}
	
	
	public void save(OrgTable org) {
		 orgDao.save(org);
	}
	
	public void update(OrgTable org) {
		 orgDao.update(org);
		
	}
	
	public void update(String sxid, String inputvalue,String systemid) {
		 orgDao.updateS(sxid,inputvalue,systemid);
		
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
