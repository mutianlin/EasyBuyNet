package com.eleven.dao;

import java.sql.ResultSet;
import java.util.List;

import com.eleven.entity.Buycar;
import com.eleven.entity.Goods;

public interface BuycarDao {
	public List<Buycar> selectByUser(int userId);

	public int addGoods(int userId,Goods g);

	public List<Buycar> value(ResultSet rs1);
}
