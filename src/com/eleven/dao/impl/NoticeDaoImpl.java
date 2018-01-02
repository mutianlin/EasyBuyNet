package com.eleven.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.eleven.entity.Notice;

public class NoticeDaoImpl implements com.eleven.dao.NoticeDao {
	
	@Override
	public List<Notice> value(ResultSet rs) {
		List<Notice> l = new ArrayList<Notice>();
		try {
			while (rs.next()) {
				Notice f = new Notice();
				f.setN_id(rs.getInt("n_id"));
				f.setN_title(rs.getString("n_title"));
				f.setN_desc(rs.getString("n_desc"));
				l.add(f);
			}
		} catch (Exception e) {
			//
		}
		return l;
	}
}
