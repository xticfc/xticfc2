package com.xticfc.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * 行政机构表
 * @author Administrator
 *
 */
@Entity
public class OrgTable implements Serializable{
	
	private static final long serialVersionUID = -3332278389556179065L;
	private String id;
	private String name;
	private String shortName;
	private String longName;
	private String parent;
	private int type;
	private String zwid;
	private int status;
	

    //以下属性在树中会用到，与实际数据库无关
    private boolean isParent;
    private List<OrgTable> children;
    private boolean checked;
    private boolean chkDisabled;
    private String target;
    private String url;
    
    
    private String orgReport;
    private String orgSysTB;
    @Transient
    public String getOrgReport() {
		return orgReport;
	}

	public void setOrgReport(String orgReport) {
		this.orgReport = orgReport;
	}
	@Transient
	public String getOrgSysTB() {
		return orgSysTB;
	}

	public void setOrgSysTB(String orgSysTB) {
		this.orgSysTB = orgSysTB;
	}

	@Transient
	public boolean getIsParent() {
		return isParent;
	}

	public void setIsParent(boolean isParent) {
		this.isParent = isParent;
	}

	@Transient
	public List<OrgTable> getChildren() {
		return children;
	}

	public void setChildren(List<OrgTable> children) {
		this.children = children;
	}

	@Transient
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	@Transient
	public boolean isChkDisabled() {
		return chkDisabled;
	}

	public void setChkDisabled(boolean chkDisabled) {
		this.chkDisabled = chkDisabled;
	}

	@Transient
	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	@Transient
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	@Id
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	
	public String getLongName() {
		return longName;
	}
	public void setLongName(String longName) {
		this.longName = longName;
	}
	
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	public String getZwid() {
		return zwid;
	}
	public void setZwid(String zwid) {
		this.zwid = zwid;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

}
