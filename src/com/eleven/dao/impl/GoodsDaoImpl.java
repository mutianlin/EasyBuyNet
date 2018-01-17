package com.eleven.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eleven.entity.Goods;
import com.eleven.util.DbUtil;

public class GoodsDaoImpl implements com.eleven.dao.GoodsDao {

	@Override
	public List<Goods> select() {
		String sql = "select * from `goods`";
		List<Object> list = new ArrayList<Object>();
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public List<Goods> selectBySmallclass(String smallClassName) {
		String sql = "select * from `goods` where smallclass=?";
		List<Object> list = new ArrayList<Object>();
		list.add(smallClassName);
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public List<Goods> selectByBigclass(String bigClassName) {
		String sql = "select * from `goods` where Bigclass=?";
		List<Object> list = new ArrayList<Object>();
		list.add(bigClassName);
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public List<Goods> selectByType(String type) {
		String sql = "select * from `goods` where type=?";
		List<Object> list = new ArrayList<Object>();
		list.add(type);
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public List<Goods> selectByDis() {
		String sql = "select * from `goods` where smallclass!=1";
		List<Object> list = new ArrayList<Object>();
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public List<Goods> value(ResultSet rs) {
		List<Goods> l = new ArrayList<Goods>();
		try {
			while (rs.next()) {
				Goods g = new Goods();
				g.setG_id(rs.getInt("g_id"));
				g.setG_name(rs.getString("g_name"));
				g.setGb_id(rs.getInt("gb_id"));
				g.setGs_id(rs.getInt("gs_id"));
				g.setG_bpic(rs.getString("g_bpic"));
				g.setG_bpic1(rs.getString("g_bpic1"));
				g.setG_bpic2(rs.getString("g_bpic2"));
				g.setG_spic1(rs.getString("g_spic1"));
				g.setG_spic2(rs.getString("g_spic2"));
				g.setG_desc(rs.getString("g_dis"));
				g.setG_carry(rs.getDouble("g_carry"));
				g.setG_count(rs.getInt("g_count"));
				g.setG_price(rs.getDouble("g_price"));
				g.setG_dis(rs.getDouble("g_dis"));
				g.setG_type(rs.getString("g_type"));
				l.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public Goods selectById(int id) {
		String sql = "select * from `goods` where g_id=?";
		List<Object> list = new ArrayList<Object>();
		list.add(id);
		List<Goods> l = value(DbUtil.executeQuery(sql, list));
		if (l.size() >= 1) {
			return l.get(0);
		} else {
			return null;
		}

	}

	@Override
	public Goods selectByName(String name) {
		String sql = "select * from `goods` where g_name=?";
		List<Object> list = new ArrayList<Object>();
		list.add(name);
		List<Goods> l = value(DbUtil.executeQuery(sql, list));
		if (l.size() >= 1) {
			return l.get(0);
		} else {
			return null;
		}
	}

	@Override
	public List<Goods> select(int number) {
		String sql = "select * from `goods` limit ?";
		List<Object> list = new ArrayList<Object>();
		list.add(number);
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public int queryByBGs_id(int id) {
		String sql = "select g_id from goods where gs_id = ? ";
		List<Object> list = new ArrayList<Object>();
		list.add(id);
		ResultSet rs = DbUtil.executeQuery(sql, list);
		try {
			rs.last();// 移动到最后
			return rs.getRow();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("com.eleven.dao.impl.GoodsDaoImpl queryByBId(int id) 获取ResultSet长度错误");
		return 0;
	}

}
