package com.xticfc.service;

import java.io.Serializable;
import java.util.List;

import com.xticfc.dao.CommonDao;
import com.xticfc.dao.UserDao;
import com.xticfc.entity.User;

public class UserService {
	CommonDao commonDao;
	UserDao userDao;
	
	
	public void update(User user){
		userDao.update(user);
	}
	
	public Serializable save(User user){
		return userDao.save(user);
	}
	
	public User get(String id){
		return (User)userDao.get(User.class, id);
	}
	
	public void delete(String id){
		userDao.delete(User.class,id);
	}
	
	
	public int countAirCount(String name, String status){
		return userDao.count(name,status);
	}
	
	public List<User> list(String name, String status, int start, int size, String order){
		List<User> userList = userDao.getUser(name, status, start, size, order);
		return userList;
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
