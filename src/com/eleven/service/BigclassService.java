package com.eleven.service;

import java.util.List;

import com.eleven.entity.Bigclass;

public interface BigclassService {
	public boolean add(String name);

	public boolean delete(String name);

	public boolean delete(int id);

	public List<Bigclass> selectAll();
}
