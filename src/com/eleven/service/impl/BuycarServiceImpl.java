package com.eleven.service.impl;

import java.util.List;

import com.eleven.dao.BuycarDao;
import com.eleven.dao.impl.BuycarDaoImpl;
import com.eleven.entity.Buycar;
import com.eleven.service.BuycarService;

public class BuycarServiceImpl implements BuycarService {

	BuycarDao buycardao = new BuycarDaoImpl();
	
	@Override
	public List<Buycar> selectByUser(int userId) {
		return buycardao.selectByUser(userId);
	}

}
