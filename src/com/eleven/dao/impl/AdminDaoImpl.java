package com.eleven.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.eleven.entity.Admin;

public class AdminDaoImpl implements com.eleven.dao.AdminDao {

	@Override
	public List<Admin> value(ResultSet rs) {
		List<Admin> l = new ArrayList<Admin>();
		try {
			while(rs.next()){
				Admin f = new Admin();
				f.setId(rs.getInt("id"));
				f.setAccount(rs.getString("account"));
				f.setPassword(rs.getString("password"));
				l.add(f);
	}
		}
		catch(Exception e){
			}
		return l;
		}


}
