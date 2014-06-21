package com.xticfc.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 彩信报用户
 * @author Administrator
 *
 */
@Entity
@Table (name="MMSUSERTYPE")
public class MmsUserType implements Serializable{
	
	
	private static final long serialVersionUID = 2938620880833552236L;
	private String id;
	private String type;
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
