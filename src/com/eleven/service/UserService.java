package com.eleven.service;

import com.eleven.entity.User;

public interface UserService {
	public User login(String account, String password);

	public boolean register(User user);
	
}
