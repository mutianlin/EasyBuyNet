package com.eleven.dao;

import java.sql.ResultSet;
import java.util.List;

import com.eleven.entity.Notice;

public interface NoticeDao {
	public List<Notice> value(ResultSet rs);
}
