package com.eleven.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.eleven.entity.Indent;

public class IndentDaoImpl implements com.eleven.dao.IndentDao {

	@Override
	public List<Indent> value(ResultSet rs) {
		List<Indent> l = new ArrayList<Indent>();
		try {
			while(rs.next()){
				Indent d = new Indent();
				d.setI_id(rs.getInt("i_id"));
				d.setU_id(rs.getInt("u_id"));
				d.setIg_id(rs.getInt("ig_id"));
				d.setI_name(rs.getString("i_name"));
				d.setI_price(rs.getInt("i_price"));
				d.setI_count(rs.getInt("i_count"));
				d.setI_money(rs.getDouble("i_money"));
				d.setI_dis(rs.getDouble("i_dis"));
				d.setI_status(rs.getString("i_status"));
				d.setI_date(rs.getDate("i_date"));
			}
		}
		catch(Exception e){
			}
		return l;
		}
}
