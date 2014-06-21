package com.xticfc.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 报表管理
 * @author Administrator
 *
 */
@Entity
@Table(name="reportmanage")
public class Report implements Serializable{
	
	private static final long serialVersionUID = 8213801404839437593L;
	private String id;
	private String code;
	private String longName;
	private Integer period;
	private String zwId;
	private String dbtable;
	private String reportStyle;
	private String status;			 
	private String filepath;
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getLongName() {
		return longName;
	}
	public void setLongName(String longName) {
		this.longName = longName;
	}
	
	public Integer getPeriod() {
		return period;
	}
	public void setPeriod(Integer period) {
		this.period = period;
	}
	
	public String getZwId() {
		return zwId;
	}
	public void setZwId(String zwId) {
		this.zwId = zwId;
	}
	public String getReportStyle() {
		return reportStyle;
	}
	public void setReportStyle(String reportStyle) {
		this.reportStyle = reportStyle;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDbtable() {
		return dbtable;
	}
	public void setDbtable(String dbtable) {
		this.dbtable = dbtable;
	}
	
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	
}
