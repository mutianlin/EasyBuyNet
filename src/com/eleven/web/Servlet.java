package com.eleven.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eleven.entity.User;
import com.eleven.service.BigclassService;
import com.eleven.service.SmallclassService;
import com.eleven.service.UserService;
import com.eleven.service.impl.BigclassServiceImpl;
import com.eleven.service.impl.SmallclassServiceImpl;
import com.eleven.service.impl.UserServiceImpl;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		UserService us = new UserServiceImpl();
		String type = request.getParameter("type");
		System.out.println("type="+type);
		HttpSession session = request.getSession();
		if ("login".equals(type)) {
			String account = request.getParameter("userName");
			String password = request.getParameter("passWord");
			User user = us.login(account, password);
			user.setPassword(null);
			session.setAttribute("user", user);
			request.getRequestDispatcher("reg-result.jsp").forward(request, response);
		}else if("register".equals(type)){
			User user = new User();
			user.setAccount(request.getParameter("userName"));
			user.setPassword(request.getParameter("passWord"));
			us.register(user);
			request.getRequestDispatcher("reg-result.jsp").forward(request, response);
		}else if("indexClass".equals(type)){
			SmallclassService smallclassService = new SmallclassServiceImpl();
			BigclassService bigclassService = new BigclassServiceImpl();
			session.setAttribute("blist", bigclassService.selectAll());
			session.setAttribute("slist", smallclassService.selectAll());
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
