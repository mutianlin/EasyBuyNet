package com.eleven.dao;

import java.sql.ResultSet;
import java.util.List;

import com.eleven.entity.Smallclass;

public interface SmallclassDao {
	public int add(String name);
	public int delete(String name);
	public List<Smallclass> selectAll();
	public List<Smallclass> value(ResultSet rs);
}
