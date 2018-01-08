package com.eleven.dao;


import java.sql.ResultSet;
import java.util.List;

import com.eleven.entity.User;

public interface UserDao {
	public User login(String account, String password);

	public int register(User user);
	
	List<User> value(ResultSet rs);
	
	public List<User> seeAllUser();
	
	public User seeUserById(int id);
	
	public int userUpdateById(int id,User u);
}
