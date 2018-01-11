package com.eleven.test;

import com.eleven.dao.UserDao;
import com.eleven.dao.impl.UserDaoImpl;
import com.eleven.entity.User;
import com.eleven.service.SmallclassService;
import com.eleven.service.impl.SmallclassServiceImpl;

public class UserTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		UserDao userDao = new UserDaoImpl();
//		User u = null;
//		u = userDao.login("test", "test");
//		System.out.println(u.getAccount());
//		
//		u.setAccount("12322132132");
//		u.setPassword("123");
//		userDao.register(u);
//		
//		u = userDao.login("12322132132", "123");
//		String acc = u.getAccount();
//		System.out.println(acc);
//		
		
		SmallclassService smallclassService = new SmallclassServiceImpl();
		if(smallclassService.add("123",2)){
			System.out.println(123);
		}
	}

}
