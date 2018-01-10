package com.eleven.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.eleven.entity.Buycar;
import com.eleven.entity.Goods;
import com.eleven.util.DbUtil;

public class BuycarDaoImpl implements com.eleven.dao.BuycarDao {

	@Override
	public List<Buycar> selectByUser(int userId) {
		String sql ="SELECT * FROM buycar WHERE u_id = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(userId);
		return value(DbUtil.executeQuery(sql, list));
	}
	
	@Override
	public List<Buycar> value(ResultSet rs) {
		List<Buycar> l = new ArrayList<Buycar>();
		try {
			while(rs.next()){
				Buycar g = new Buycar();
				g.setC_id(rs.getInt("c_id"));
				g.setU_id(rs.getInt("u_id"));
				g.setG_id(rs.getInt("g_id"));
				g.setC_name(rs.getString("c_name"));
				g.setC_price(rs.getDouble("c_price"));
				g.setC_count(rs.getInt("c_count"));
				g.setC_desc(rs.getString("c_desc"));
				g.setC_money(rs.getDouble("c_money"));
				l.add(g);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public int addGoods(int userId,Goods g) {
		String sql ="SELECT * FROM buycar WHERE u_id = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(userId);
		return DbUtil.executeUpdate(sql, list);
	}

}
