package com.xticfc.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * 业务表属性
 * @author Administrator
 *
 */
@Entity
public class TableInfo implements Serializable{
	
	private static final long serialVersionUID = 8213801404839437593L;
	private String id;
	private String code;
	private String longName;
	private int period;
	private String zwId;
	private String bcId;
	private String dbtable;
	private int orderCode;
	private String mobiles;
	
	private String isChecked;			//判断是否有关联，本字段与数据库无关. 0未关联（未选中），1有关联（选中）
	
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
	
	public String getLongName() {
		return longName;
	}
	public void setLongName(String longName) {
		this.longName = longName;
	}
	
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	
	public String getZwId() {
		return zwId;
	}
	public void setZwId(String zwId) {
		this.zwId = zwId;
	}
	
	public String getBcId() {
		return bcId;
	}
	public void setBcId(String bcId) {
		this.bcId = bcId;
	}
	
	public String getDbtable() {
		return dbtable;
	}
	public void setDbtable(String dbtable) {
		this.dbtable = dbtable;
	}
	
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public String getMobiles() {
		return mobiles;
	}
	public void setMobiles(String mobiles) {
		this.mobiles = mobiles;
	}
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	@Transient
	public String getIsChecked() {
		return isChecked;
	}
	public void setIsChecked(String isChecked) {
		this.isChecked = isChecked;
	}
	
}
