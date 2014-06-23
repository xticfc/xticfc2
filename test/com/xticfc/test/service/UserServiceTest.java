package com.xticfc.test.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xticfc.dao.OrgDao;
import com.xticfc.dao.UserDao;
import com.xticfc.entity.User;
import com.xticfc.service.LoginService;
import com.xticfc.service.OrgService;


public class UserServiceTest extends BaseServiceTest {

	@Resource
	private UserDao userDao;
	
	@Resource
	private OrgDao orgDao;
	
	@Resource
	private OrgService orgService;
	
	@Resource
	private LoginService loginService;
	
	@Test
	public void webLoginTest(){
		String username = "0";
		String password = "0";
		User user = loginService.webLogin(username, password);
		List<User> list = userDao.list(username, password);
		System.out.println(list.size());
		System.out.println(user.getName());
	}
	
	@Test
	@Transactional(propagation=Propagation.NOT_SUPPORTED)//禁止事务回滚
	public void cre(){
		orgService.updateOrgTable();
	}
}
