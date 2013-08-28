package com.xticfc.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import com.xticfc.dao.TreeDao;
import com.xticfc.entity.OrgTable;
import com.xticfc.util.StringUtil;



public class TreeService {

	TreeDao treeDao;

	public List<OrgTable> getChildren(String id){
		List<OrgTable> orgList = this.getChildrenById(id);
		OrgTable orgtable;
		if(null != orgList && orgList.size() > 0){
			for(Iterator<OrgTable> iter = orgList.iterator(); iter.hasNext();){
				orgtable = iter.next();
				int count = treeDao.countChildren(orgtable.getId());
				if(count > 0){
					orgtable.setIsParent(true);
				}else{
					orgtable.setIsParent(false);
				}
			}
		}
		return orgList;
	}
	
	
	public List<OrgTable> getAll(String id){
		return getChildren(id);
	}
	
	
	/**
	 * 通过站点主键，查出所有下属站点
	 * @param id
	 * @return
	 */
	public List<OrgTable> getChildrenById(String id){
		return treeDao.getChildren(id);
	}
	public TreeDao getTreeDao() {
		return treeDao;
	}
	public void setTreeDao(TreeDao treeDao) {
		this.treeDao = treeDao;
	}

	
}
