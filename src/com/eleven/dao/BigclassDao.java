package com.eleven.dao;

import java.sql.ResultSet;
import java.util.List;

import com.eleven.entity.Bigclass;

public interface BigclassDao {
	public int add(String name);
	public int delete(String name);
	public List<Bigclass> selectAll();
	
	public List<Bigclass> value(ResultSet rs);
}
