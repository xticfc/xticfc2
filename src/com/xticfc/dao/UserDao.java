package com.xticfc.dao;




import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.xticfc.entity.User;
import com.xticfc.entity.UserReport;

public class UserDao extends BaseDao{

	User user;
	
	public List<User> getUser(String name, String status, int start, int size, String order){
		String cond = "1=1";
		List<Object> param = new ArrayList<Object>();
		if(name != null && name.length() > 0){
			cond += " and name like '%'||?||'%' ";
			param.add(name);
		}
		if(null != status && status.length() > 0){
			cond += " and flag=?";
			param.add(status);
		}
		return super.list(User.class,cond, param.toArray(), start, size, order);
	}
	
	/**
	 * 通过登录用户名，查出用户实体，可能会返回null
	 * @param loginId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<User> listByLoginId(Serializable loginId){
		String sql = "from User where loginid=?";
		return super.list(sql, new Object[]{loginId});
	}
	
	public List<Map<String,Object>> getUser(String condition, Object[] param, int start, int size, String order){
		String sql = "SELECT o.name as orgname, u.* FROM orgtable o, userinfo u WHERE u.SXID=o.ID";
		return listByNative(sql, null, start, size, order);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<User> list(String username, String password){
		String sql = "from User where loginid=? and password=?";
		return super.list(sql, new Object[]{username, password});
	}
	
	
	public List<User> list (int start, int size, String order){
		return list(User.class, start, size, order);
	}
	
	
	/**
	 * 用户登录
	 * 通过用户登录ID和密码，查出这个用户
	 * 可能返回null
	 * @param username
	 * @param password
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<User> login(String username, String password){
		String sql = " from User where loginId = ? and password = ?";
		return super.list(sql, new Object[]{username, password});
	}
	
	/**
	 * 查出用户信息，通过用户登录ID,可能返回null
	 * @param loginid
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<User> getByLoginid(String loginid){
		String sql = " from User where loginId = ?";
		return super.list(sql, new Object[]{loginid});
	}
	
	/**
	 * 根据用户主键，分页查询UserReport
	 * @param userId
	 * @return
	 */
	public List<UserReport> getUserReport(String userId){
		if(null == userId || userId.length() ==0){
			return null;
		}
		return super.list(UserReport.class, " userId=?", new Object[]{userId}, 0, 0, null);
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int count(String name, String status) {
		String hql = " select count(*) from User where 1=1 ";
		List<Object> param = new ArrayList<Object>();
		if(name != null && name.length() > 0){
			hql += " and name  like '%'||?||'%' ";
			param.add(name);
		}
		if(null != status && status.length() > 0){
			hql += " and flag = ?";
			param.add(status);
		}
		return super.count(hql, param.toArray());
	}
}
