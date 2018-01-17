package com.eleven.dao;

import java.sql.ResultSet;
import java.util.List;

import com.eleven.entity.Goods;

public interface GoodsDao {
	public List<Goods> select();
	public List<Goods> select(int number);
	public List<Goods> selectBySmallclass(String smallClassName);
	public List<Goods> selectByBigclass(String bigClassName);
	public List<Goods> selectByType(String type);
	public List<Goods> selectByDis();
	public Goods selectById(int id);
	public Goods selectByName(String name);
	List<Goods> value(ResultSet rs);
	public int queryByBGs_id(int id);
}
