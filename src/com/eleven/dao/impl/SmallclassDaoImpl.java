package com.eleven.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eleven.entity.Smallclass;
import com.eleven.util.DbUtil;

public class SmallclassDaoImpl implements com.eleven.dao.SmallclassDao {
	@Override
	public int add(String name, int bigid) {
		String sql = "INSERT INTO smallclass(s_name,sb_id) VALUES(?,?)";
		List<Object> list = new ArrayList<Object>();
		list.add(name);
		list.add(bigid);
		return DbUtil.executeUpdate(sql, list);
	}

	@Override
	public int delete(String name) {
		String sql = "DELETE FROM smallclass WHERE s_name=?";
		List<Object> list = new ArrayList<Object>();
		list.add(name);
		return DbUtil.executeUpdate(sql, list);
	}

	@Override
	public List<Smallclass> selectAll() {
		String sql = "select * from smallclass ORDER BY s_id";
		List<Object> list = new ArrayList<Object>();
		// System.out.println("Smallclass see");
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public List<Smallclass> value(ResultSet rs) {
		List<Smallclass> l = new ArrayList<Smallclass>();
		try {
			while (rs.next()) {
				Smallclass s = new Smallclass();
				s.setS_id(rs.getInt("s_id"));
				s.setS_name(rs.getString("s_name"));
				s.setSb_id(rs.getInt("sb_id"));
				l.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public int queryByBId(int id) {
		String sql = "select sb_id from smallclass where sb_id = ? ";
		List<Object> list = new ArrayList<Object>();
		list.add(id);
		ResultSet rs = DbUtil.executeQuery(sql, list);
		try {
			rs.last();// 移动到最后
			return rs.getRow();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("com.eleven.dao.impl.SmallclassDaoImpl queryByBId(int id) 获取ResultSet长度错误");
		return 0;
	}

	@Override
	public int delete(int id) {
		String sql = "DELETE FROM goods WHERE gs_id=?";
		List<Object> list = new ArrayList<Object>();
		list.add(id);
		DbUtil.executeUpdate(sql, list);
		sql = "DELETE FROM smallclass WHERE s_id=?";
		return DbUtil.executeUpdate(sql, list);
	}
}
