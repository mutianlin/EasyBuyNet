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
		String sql = "select * from `goods`";
		List<Object> list = new ArrayList<Object>();
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public List<Goods> selectByBigclass(String bigClassName) {
		String sql = "select * from `goods`";
		List<Object> list = new ArrayList<Object>();
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public List<Goods> selectByType(String type) {
		String sql = "select * from `goods`";
		List<Object> list = new ArrayList<Object>();
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public List<Goods> selectByDis() {
		String sql = "select * from `goods`";
		List<Object> list = new ArrayList<Object>();
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public List<Goods> value(ResultSet rs) {
		try {
			while(rs.next()){
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
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
