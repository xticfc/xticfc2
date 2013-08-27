package com.xticfc.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * 系统信息表
 * @author Administrator
 *
 */
@Entity
@Table (name="systemtable")
public class SystemTable implements Serializable{

	
	private static final long serialVersionUID = -356432058169210236L;
	private String id;
	private String name;
	private String type;
	private String ip;
	private String port;
	private String header;
	private String rc4key;
	private String projectName;
	private String status;
//	private String orgId;
	
	private String checked;			//判断是否有关联，本字段与数据库无关. 0未关联（未选中），1有关联（选中）
	
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
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
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getRc4key() {
		return rc4key;
	}
	public void setRc4key(String rc4key) {
		this.rc4key = rc4key;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	@Transient
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
//	public String getOrgId() {
//		return orgId;
//	}
//	public void setOrgId(String orgId) {
//		this.orgId = orgId;
//	}

}
