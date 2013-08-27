package com.xticfc.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;


/**
 * 用户可操作关系表
 * @author Administrator
 *
 */
@Entity
@IdClass(UserReportPK.class)
public class UserReport implements Serializable{
	
	
	private static final long serialVersionUID = -6754498872316232071L;

	private String userId;
	
	private String tableId;
	
	
	@Id
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Id
	public String getTableId() {
		return tableId;
	}
	public void setTableId(String tableId) {
		this.tableId = tableId;
	}
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	

}
