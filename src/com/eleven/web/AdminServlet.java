package com.eleven.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eleven.entity.User;
import com.eleven.service.BigclassService;
import com.eleven.service.UserService;
import com.eleven.service.impl.BigclassServiceImpl;
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
		if ("userDelete".equals(type)) {// 删除操作
			int id = Integer.valueOf(request.getParameter("deleteById"));
			UserService us = new UserServiceImpl();
			us.userDelete(id);
			request.getRequestDispatcher("adminServlet?type=user").forward(
					request, response);
		} else if ("userAdd".equals(type)) {// 用户新增
			UserService us = new UserServiceImpl();
			User u = new User();
			/* 获取表单信息 */
			u.setAccount(request.getParameter("userName"));
			u.setUserName(request.getParameter("name"));
			u.setPassword(request.getParameter("passWord"));
			System.out.println(request.getParameter("passWord"));
			int sex = Integer.valueOf(request.getParameter("sex"));
			if (sex == 1) {
				u.setSex("男");
			} else if (sex == 0) {
				u.setSex("女");
			} else {
				u.setSex("未知");
			}
			u.setBirth(request.getParameter("birthyear") + "."
					+ request.getParameter("birthmonth") + "."
					+ request.getParameter("birthday"));
			u.setPhone(request.getParameter("mobile"));
			u.setAddress(request.getParameter("address"));
			/* 获取表单信息结束 */
			us.userAdd(u);
			request.getRequestDispatcher("manage/manage-result.jsp").forward(
					request, response);
		} else if ("user".equals(type)) {// 用户管理
			UserService us = new UserServiceImpl();
			request.setAttribute("userlist", us.seeAllUser());
			request.getRequestDispatcher("manage/user.jsp").forward(request,
					response);
		} else if ("userUpdate".equals(type)) {// 用户信息修改界面数据获取
			UserService us = new UserServiceImpl();
			int id = Integer.valueOf(request.getParameter("updateById"));
			request.setAttribute("updateUser", us.seeUserById(id));
			request.getRequestDispatcher("manage/user-modify.jsp").forward(
					request, response);
		} else if ("userDoUpdate".equals(type)) {// 对数据库执行用户信息修改
			UserService us = new UserServiceImpl();
			int id = Integer.valueOf(request.getParameter("updateById"));
			User u = new User();
			/* 获取表单信息 */
			u.setUserName(request.getParameter("name"));
			u.setPassword(request.getParameter("passWord"));
			int sex = Integer.valueOf(request.getParameter("sex"));
			if (sex == 1) {
				u.setSex("男");
			} else if (sex == 0) {
				u.setSex("女");
			} else {
				u.setSex("未知");
			}
			u.setBirth(request.getParameter("birthyear") + "."
					+ request.getParameter("birthmonth") + "."
					+ request.getParameter("birthday"));
			u.setPhone(request.getParameter("mobile"));
			u.setAddress(request.getParameter("address"));
			/* 获取表单信息结束 */
			us.userUpdateById(id, u);
			request.getRequestDispatcher("adminServlet?type=user").forward(
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
			BigclassService bigclassService = new BigclassServiceImpl();
			request.setAttribute("biglist", bigclassService.selectAll());//大分类存入会话
			request.getRequestDispatcher("manage/productClass-add.jsp").forward(
					request, response);
		} else if ("productClass".equals(type)) {// 分类管理
			request.getRequestDispatcher("manage/productClass.jsp").forward(
					request, response);
		}
	}
}
