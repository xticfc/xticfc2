package com.xticfc.service;

import java.io.Serializable;
import java.util.List;

import com.xticfc.dao.CommonDao;
import com.xticfc.dao.UserDao;
import com.xticfc.entity.User;

public class SysService {

	CommonDao commonDao;
	UserDao userDao;
	
	/**
	 * 处理网页登录
	 * @param username
	 * @param password
	 */
	public User webLogin(String username, String password){
		List<User> userList = userDao.list(username, password);
		if(null != userList && userList.size() > 0){
			return userList.get(0);
		}else{
			return null;
		}
	}
	
	
	/**
	 * 根据任意实体的主键，查出实体
	 * @param entity
	 * @param id
	 * @return
	 */
	public Object get(Class entity, String id){
		return commonDao.get(entity, id);
	}
	
	/**
	 * 保存任意实体
	 * @param entity
	 * @return
	 */
	public Serializable save(Object entity){
		return commonDao.save(entity);
	}
	
	
	
	

	/**
	 * 更新任何实体
	 * @param o
	 */
	public void update(Object entity){
		commonDao.update(entity);
	}
	
	
	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
