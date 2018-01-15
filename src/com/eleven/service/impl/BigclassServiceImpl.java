package com.eleven.service.impl;

import java.util.List;

import com.eleven.dao.BigclassDao;
import com.eleven.dao.impl.BigclassDaoImpl;
import com.eleven.entity.Bigclass;
import com.eleven.service.BigclassService;

public class BigclassServiceImpl implements BigclassService {

	BigclassDao bigclassdao = new BigclassDaoImpl();

	@Override
	public boolean add(String name) {
		if (bigclassdao.add(name) == 1) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean delete(String name) {
		if (bigclassdao.delete(name) == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<Bigclass> selectAll() {
		return bigclassdao.selectAll();
	}

	@Override
	public boolean delete(int id) {
		if (bigclassdao.delete(id) == 1) {
			return true;
		} else {
			return false;
		}
	}
}
