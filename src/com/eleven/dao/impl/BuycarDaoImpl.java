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
		String sql = "SELECT b.c_id,b.u_id,b.g_id,b.c_name,b.c_price,b.c_count"
				+ ",b.c_desc,b.c_money,g.g_bpic FROM buycar AS b "
				+ "INNER JOIN goods AS g ON b.g_id = g.g_id WHERE b.u_id = ?";
		List<Object> list = new ArrayList<Object>();
		list.add(userId);
		return value(DbUtil.executeQuery(sql, list));
	}

	@Override
	public List<Buycar> value(ResultSet rs1) {
		List<Buycar> lb = new ArrayList<Buycar>();
		try {
			while (rs1.next()) {
				Buycar b = new Buycar();
				b.setC_id(rs1.getInt("c_id"));
				b.setU_id(rs1.getInt("u_id"));
				b.setG_id(rs1.getInt("g_id"));
				b.setC_name(rs1.getString("c_name"));
				b.setC_price(rs1.getDouble("c_price"));
				b.setC_count(rs1.getInt("c_count"));
				b.setC_desc(rs1.getString("c_desc"));
				b.setC_money(rs1.getDouble("c_money"));
				b.setG_bpic(rs1.getString("g_bpic"));
				lb.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lb;
	}

	@Override
	public int addGoods(int userId, Goods g) {
		String sql = "INSERT INTO `buycar`(u_id,c_name,g_id,c_price,c_count,c_money) VALUES (?, ?, ?, ?, ?, ?);";
		List<Object> list = new ArrayList<Object>();
		list.add(userId);
		list.add(g.getG_name());
		list.add(g.getG_id());
		list.add(g.getG_price());
		list.add(1);
		list.add(g.getG_price());
		return DbUtil.executeUpdate(sql, list);
	}

}
