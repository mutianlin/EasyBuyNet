package com.eleven.service.impl;

import java.util.List;

import com.eleven.dao.GoodsDao;
import com.eleven.dao.impl.GoodsDaoImpl;
import com.eleven.entity.Goods;
import com.eleven.service.GoodsService;

public class GoodsServiceImpl implements GoodsService {

	GoodsDao goodsDao = new GoodsDaoImpl();
	
	@Override
	public List<Goods> select() {
		return goodsDao.select();
	}

	@Override
	public List<Goods> selectBySmallclass(String smallClassName) {
		return goodsDao.selectBySmallclass(smallClassName);
	}

	@Override
	public List<Goods> selectByBigclass(String bigClassName) {
		return goodsDao.selectByBigclass(bigClassName);
	}

	@Override
	public List<Goods> selectByType(String type) {
		return goodsDao.selectByType(type);
	}

	@Override
	public List<Goods> selectByDis() {
		return goodsDao.selectByDis();
	}

}
