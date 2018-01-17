package com.eleven.service;

import java.util.List;

import com.eleven.entity.Smallclass;

public interface SmallclassService {
	public boolean add(String name,int bigid);
	public boolean delete(String name);
	public List<Smallclass> selectAll();
	public int queryByBId(int id);
	public boolean delete(int id);
}
