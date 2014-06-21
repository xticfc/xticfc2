package com.xticfc.service;

import java.util.List;

import com.xticfc.dao.UserDao;
import com.xticfc.entity.User;

public class LoginService extends BaseService {

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


	public UserDao getUserDao() {
		return userDao;
	}


	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
}
