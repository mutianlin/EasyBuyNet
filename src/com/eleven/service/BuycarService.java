package com.eleven.service;

import java.util.List;

import com.eleven.entity.Buycar;

public interface BuycarService {
	public List<Buycar> selectByUser(int userId);

}
