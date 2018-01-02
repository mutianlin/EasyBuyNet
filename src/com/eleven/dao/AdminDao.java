package com.eleven.dao;

import java.sql.ResultSet;
import java.util.List;

import com.eleven.entity.Admin;

public interface AdminDao {
	public List<Admin> value(ResultSet rs);
}
