package com.eleven.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eleven.entity.Bigclass;
import com.eleven.util.DbUtil;

public class BigclassDaoImpl implements com.eleven.dao.BigclassDao{

	@Override
	public int add(String name) {
		String sql = "INSERT INTO bigclass(b_name) VALUES(?)";
		List<Object> list = new ArrayList<Object>();
		list.add(name);
		return DbUtil.executeUpdate(sql, list);
	}

	@Override
	public int delete(String name) {
		String sql = "DELETE FROM bigclass WHERE b_name=?";
		List<Object> list = new ArrayList<Object>();
		list.add(name);
		return DbUtil.executeUpdate(sql, list);
	}

	@Override
	public List<Bigclass> selectAll() {
		String sql = "select * from bigclass";
		List<Object> list = new ArrayList<Object>();
//		System.out.println("Bigclass see");
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public List<Bigclass> value(ResultSet rs) {
		List<Bigclass> l = new ArrayList<Bigclass>();
		try {
			while(rs.next()){
				Bigclass b = new Bigclass();
				b.setB_id(rs.getInt("b_id"));
				b.setB_name(rs.getString("b_name"));
				l.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(l.size()+"line;in bigClass dao");
		return l;
	}

	@Override
	public int delete(int id) {
		String sql = "DELETE FROM bigclass WHERE b_id=?";
		List<Object> list = new ArrayList<Object>();
		list.add(id);
		return DbUtil.executeUpdate(sql, list);
	}

}
