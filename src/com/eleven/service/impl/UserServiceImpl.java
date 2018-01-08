package com.eleven.service.impl;

import java.util.List;

import com.eleven.dao.UserDao;
import com.eleven.dao.impl.UserDaoImpl;
import com.eleven.entity.User;
import com.eleven.service.UserService;

public class UserServiceImpl implements UserService {

	UserDao userDao = new UserDaoImpl();

	@Override
	public User login(String username, String password) {
		return userDao.login(username, password);
	}

	@Override
	public boolean register(User user) {
		if(userDao.register(user)==1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<User> seeAllUser() {
		return userDao.seeAllUser();
	}

}
