/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.xticfc.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="func_main")
public class FuncMain implements Serializable{

	private static final long serialVersionUID = -4444444276319181966L;
	private String id;
    private String title;
    private Integer ordercode;

    @Id
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(Integer ordercode) {
		this.ordercode = ordercode;
	}

}
