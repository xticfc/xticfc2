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
@Table(name="func_sub")
public class FuncSub implements Serializable{

	private static final long serialVersionUID = -3260219834634546441L;
	private String funcid;
    private String funcname;
    private String funcmainid;
    private Integer funclevel;
    private String type;
    private String url;
    private String imgurl;
    private Integer status;
    private String descon;
    private Integer ordercode;
    

    @Id
	public String getFuncid() {
		return funcid;
	}

	public void setFuncid(String funcid) {
		this.funcid = funcid;
	}

	public String getFuncname() {
		return funcname;
	}

	public void setFuncname(String funcname) {
		this.funcname = funcname;
	}

	public String getFuncmainid() {
		return funcmainid;
	}

	public void setFuncmainid(String funcmainid) {
		this.funcmainid = funcmainid;
	}

	public Integer getFunclevel() {
		return funclevel;
	}

	public void setFunclevel(Integer funclevel) {
		this.funclevel = funclevel;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getDescon() {
		return descon;
	}

	public void setDescon(String desc) {
		this.descon = desc;
	}


	public Integer getOrdercode() {
		return ordercode;
	}

	public void setOrdercode(Integer ordercode) {
		this.ordercode = ordercode;
	}
    

}
