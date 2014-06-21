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
@Table (name="org_systable")
public class OrgSysTable implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String orgid;
	private String systableid;
	@Id
	public String getOrgid() {
		return orgid;
	}
	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}
	@Id
	public String getSystableid() {
		return systableid;
	}
	public void setSystableid(String systableid) {
		this.systableid = systableid;
	}

	

}
