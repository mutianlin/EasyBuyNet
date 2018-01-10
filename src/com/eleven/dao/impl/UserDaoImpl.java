package com.eleven.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eleven.entity.User;
import com.eleven.util.DbUtil;

public class UserDaoImpl implements com.eleven.dao.UserDao {

	@Override
	public User login(String account, String password) {
		String sql = "select * from user where account = ? and password = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(account);
		list.add(password);
		List<User> l = value(DbUtil.executeQuery(sql, list));
//		System.out.println("登录 in userdao");
		if(l.size()==1){
			return l.get(0);
		}else{
			return null;
		}
	}

	@Override
	public int register(User user) {
		String sql = "INSERT INTO `user`(account,password,userName,sex) VALUES(?,?,'','')";
		List<Object> list = new ArrayList<Object>();
		list.add(user.getAccount());
		list.add(user.getPassword());
//		System.out.println("注册 in userdao");
		return DbUtil.executeUpdate(sql, list);
	}

	@Override
	public List<User> value(ResultSet resultset) {
		List<User> list = new ArrayList<User>();
		try {
			while(resultset.next()){
				User u = new User();
				u.setId(resultset.getInt("id"));
				u.setAccount(resultset.getString("account"));
				u.setPassword(resultset.getString("password"));
				u.setUserName(resultset.getString("userName"));
				u.setSex(resultset.getString("sex"));
				u.setBirth(resultset.getString("birth"));
				u.setIdCard(resultset.getString("idCard"));
				u.setEmail(resultset.getString("email"));
				u.setPhone(resultset.getString("phone"));
				u.setAddress(resultset.getString("address"));
				u.setLikes(resultset.getString("likes"));
				list.add(u);
			}
		} catch (SQLException e) {
//			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<User> seeAllUser() {
		String sql = "select * from user";
		List<Object> list = new ArrayList<Object>();
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public User seeUserById(int id) {
		String sql = "select * from user where id= ? ";
		List<Object> list = new ArrayList<Object>();
		list.add(id);
		List<User> l = value(DbUtil.executeQuery(sql, list));
		if(l.size()==1){
			return l.get(0);
		}else{
			return null;
		}
	}

	@Override
	public int userUpdateById(int id,User u) {
		System.out.println("in userUpdateById");
		System.out.println(u.getPhone());
		String sql = "UPDATE `user` SET userName=? ,password=? ,userName=? ,sex=? ,birth=? ,phone=? ,address=? WHERE id=?";
		List<Object> list = new ArrayList<Object>();
		list.add(u.getUserName());
		list.add(u.getPassword());
		list.add(u.getUserName());
		list.add(u.getSex());
		list.add(u.getBirth());
		list.add(u.getPhone());
		list.add(u.getAddress());
		list.add(id);
		return DbUtil.executeUpdate(sql, list);
	}

}
