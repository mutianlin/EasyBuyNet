package com.eleven.service;

import java.util.List;

import com.eleven.entity.Goods;

public interface GoodsService {
	/**
	 * 目前用于显示首页所有商品，因为商品少
	 * @return
	 */
	public List<Goods> select();
	/**
	 * 获得前<strong>number</strong>个商品
	 * @return 
	 */
	public List<Goods> select(int number);
	public List<Goods> selectBySmallclass(String smallClassName);
	public List<Goods> selectByBigclass(String bigClassName);
	public List<Goods> selectByType(String type);
	public Goods selectByName(String name);
	public Goods selectById(int id);
	/**
	 * 逻辑上说不通，但是目前先搁在这里了
	 * 查询所有折扣不为1的商品，用于显示首页“今日特价”
	 * @return
	 */
	public List<Goods> selectByDis();
	
	public int queryByBGs_id(int id);
}
