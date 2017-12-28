package com.eleven.service;

import java.util.List;

import com.eleven.entity.Smallclass;

public interface SmallclassService {
	public boolean add(String name);
	public boolean delete(String name);
	public List<Smallclass> selectAll();
}
