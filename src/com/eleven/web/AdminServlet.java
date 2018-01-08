package com.eleven.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eleven.entity.User;
import com.eleven.service.UserService;
import com.eleven.service.impl.UserServiceImpl;

public class AdminServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("admin doGet");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		if ("delete".equals(type)) {

		}

		if ("userAdd".equals(type)) {// 用户新增
			request.getRequestDispatcher("manage/user-add.jsp").forward(
					request, response);
		} else if ("user".equals(type)) {// 用户管理
			UserService us = new UserServiceImpl();
			request.setAttribute("userlist", us.seeAllUser());
			request.getRequestDispatcher("manage/user.jsp").forward(request,
					response);
		} else if ("userUpdate".equals(type)) {// 用户信息修改
			UserService us = new UserServiceImpl();
			int id = Integer.valueOf(request.getParameter("updateById"));
			request.setAttribute("updateUser", us.seeUserById(id));
			request.getRequestDispatcher("manage/user-modify.jsp").forward(
					request, response);
		} else if ("userDoUpdate".equals(type)) {// 用户信息修改
			UserService us = new UserServiceImpl();
			int id = Integer.valueOf(request.getParameter("updateById"));
			
			us.seeUserById(id);
			
			request.getRequestDispatcher("manage/user-modify.jsp").forward(
					request, response);
		} else if ("productAdd".equals(type)) {// 商品新增
			request.getRequestDispatcher("manage/product-add.jsp").forward(
					request, response);
		} else if ("product".equals(type)) {// 商品管理
			request.getRequestDispatcher("manage/product.jsp").forward(request,
					response);
		} else if ("order".equals(type)) {// 订单管理
			request.getRequestDispatcher("manage/order.jsp").forward(request,
					response);
		} else if ("guestbook".equals(type)) {// 留言管理
			request.getRequestDispatcher("manage/guestbook.jsp").forward(
					request, response);
		} else if ("newsAdd".equals(type)) {// 新闻新增
			request.getRequestDispatcher("manage/news-add.jsp").forward(
					request, response);
		} else if ("news".equals(type)) {// 新闻管理
			request.getRequestDispatcher("manage/news.jsp").forward(request,
					response);
		} else if ("productClassAdd".equals(type)) {// 分类新增
			request.getRequestDispatcher("manage/product-add.jsp").forward(
					request, response);
		} else if ("productClass".equals(type)) {// 分类管理
			request.getRequestDispatcher("manage/productClass.jsp").forward(
					request, response);
		}
	}
}
