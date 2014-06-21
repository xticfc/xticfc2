package com.xticfc.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table (name="userinfo")
public class User implements java.io.Serializable{
	
	private static final long serialVersionUID = -3435228229442934760L;
	
	private String userId;			//主键
	private String sxId;
	private Integer userLevel;
	private Integer userType;
	private String loginId;
	private String password;
	private String name;
	private String duty;
	private String mobile;
	private String tel;
	private String zc;
	private String mail;
	private String latestIp;
	private Date latestTime;
	private Integer totalLogin;
	private String pwdQuestion;
	private String pwdAnswer;
	private Date registTime;
	private String status;
	private String flag;
	@Id
	@Column (name="userid", nullable=false)
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSxId() {
		return sxId;
	}
	public void setSxId(String sxId) {
		this.sxId = sxId;
	}
	public Integer getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(Integer userLevel) {
		this.userLevel = userLevel;
	}
	public Integer getUserType() {
		return userType;
	}
	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getZc() {
		return zc;
	}
	public void setZc(String zc) {
		this.zc = zc;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getLatestIp() {
		return latestIp;
	}
	public void setLatestIp(String latestIp) {
		this.latestIp = latestIp;
	}
	public Date getLatestTime() {
		return latestTime;
	}
	public void setLatestTime(Date latestTime) {
		this.latestTime = latestTime;
	}
	public Integer getTotalLogin() {
		return totalLogin;
	}
	public void setTotalLogin(Integer totalLogin) {
		this.totalLogin = totalLogin;
	}
	public String getPwdQuestion() {
		return pwdQuestion;
	}
	public void setPwdQuestion(String pwdQuestion) {
		this.pwdQuestion = pwdQuestion;
	}
	public String getPwdAnswer() {
		return pwdAnswer;
	}
	public void setPwdAnswer(String pwdAnswer) {
		this.pwdAnswer = pwdAnswer;
	}
	public Date getRegistTime() {
		return registTime;
	}
	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
	
	
}
