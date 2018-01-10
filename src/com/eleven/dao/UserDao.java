package com.eleven.dao;

import java.sql.ResultSet;
import java.util.List;

import com.eleven.entity.User;

public interface UserDao {
	/**
	 * 用户登录
	 * 
	 * @param account
	 * @param password
	 * @return
	 */
	public User login(String account, String password);

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @return
	 */
	public int register(User user);

	/**
	 * ResultSet转换list
	 * 
	 * @param rs
	 * @return
	 */
	List<User> value(ResultSet rs);

	/**
	 * 查看所有用户
	 * 
	 * @return
	 */
	public List<User> seeAllUser();

	/**
	 * 通过id查询用户
	 * 
	 * @param id
	 * @return
	 */
	public User seeUserById(int id);

	/**
	 * 通过id修改用户信息
	 * 
	 * @param id
	 * @param u
	 * @return
	 */
	public int userUpdateById(int id, User u);

	/**
	 * 管理员用户添加
	 * 
	 * @param u
	 * @return
	 */
	public int userAdd(User u);

	/**
	 * 管理员用户删除
	 * 
	 * @param id
	 * @return
	 */
	public int userDelete(int id);
}
