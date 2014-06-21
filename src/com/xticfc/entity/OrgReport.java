package com.xticfc.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @author xticfc
 *
 */
@Entity
@Table (name="org_report")
public class OrgReport implements Serializable{

	
	private static final long serialVersionUID = 8545999380101902578L;
	private String orgid;
	private String tableId;
	@Id
	public String getOrgid() {
		return orgid;
	}
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	@Id
	public String getTableId() {
		return tableId;
	}
	public void setTableId(String tableId) {
		this.tableId = tableId;
	}
	
	

}
