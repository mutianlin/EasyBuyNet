package com.eleven.service;

import java.util.List;

import com.eleven.entity.User;

public interface UserService {
	public User login(String account, String password);

	public boolean register(User user);
	
	public List<User> seeAllUser();
	
	public User seeUserById(int id);
	
	public boolean userUpdateById(int id,User u);
}
