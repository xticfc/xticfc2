package com.xticfc.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.xticfc.dao.UserDao;
import com.xticfc.dto.UserDto;
import com.xticfc.entity.User;
import com.xticfc.util.StringUtil;

public class UserService extends BaseService{
	UserDao userDao;
	
	
	public User get(Serializable id){
		return (User)userDao.get(User.class, id);
	}
	
	public void delete(String id){
		userDao.delete(User.class,id);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<UserDto> list(int start, int size, String order){
		List<Map<String, Object>> list = userDao.getUser(null, new Object[]{}, start, size, order);
		List<UserDto> result = (List<UserDto>)StringUtil.mapToList(UserDto.class, list);
		return result;
	}
	
	public int count(){
		return userDao.count(User.class);
	}
	
	public List<User> list(String name, String status, int start, int size, String order){
		List<User> userList = userDao.getUser(name, status, start, size, order);
		return userList;
	}
	
	
	public int countAirCount(String name, String status){
		return userDao.count(name,status);
	}
	
	
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
}
