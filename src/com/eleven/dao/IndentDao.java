package com.eleven.dao;

import java.sql.ResultSet;
import java.util.List;

import com.eleven.entity.Indent;

public interface IndentDao {
	public List<Indent> value(ResultSet rs);
}
