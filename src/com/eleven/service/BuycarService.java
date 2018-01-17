package com.eleven.service;

import java.util.List;

import com.eleven.entity.Buycar;
import com.eleven.entity.Goods;

public interface BuycarService {
	public List<Buycar> selectByUser(int userId);
	public boolean addGoods(int userId,Goods g);
//	public boolean addGoods(int userId,int goodsId);
}
