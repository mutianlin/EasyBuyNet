package com.eleven.service.impl;

import java.util.List;

import com.eleven.dao.SmallclassDao;
import com.eleven.dao.impl.SmallclassDaoImpl;
import com.eleven.entity.Smallclass;
import com.eleven.service.SmallclassService;

public class SmallclassServiceImpl implements SmallclassService {

	SmallclassDao smallclassDao = new SmallclassDaoImpl();

	@Override
	public boolean add(String name) {
		if (smallclassDao.add(name) == 1) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean delete(String name) {
		if (smallclassDao.delete(name) == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<Smallclass> selectAll() {
		return smallclassDao.selectAll();
	}

}
