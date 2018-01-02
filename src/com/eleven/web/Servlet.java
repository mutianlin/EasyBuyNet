package com.eleven.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eleven.entity.Goods;
import com.eleven.entity.User;
import com.eleven.service.BigclassService;
import com.eleven.service.GoodsService;
import com.eleven.service.SmallclassService;
import com.eleven.service.UserService;
import com.eleven.service.impl.BigclassServiceImpl;
import com.eleven.service.impl.GoodsServiceImpl;
import com.eleven.service.impl.SmallclassServiceImpl;
import com.eleven.service.impl.UserServiceImpl;

public class Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//编码统一
		response.setCharacterEncoding("UTF-8");
		UserService us = new UserServiceImpl();
		String type = request.getParameter("type");
		System.out.println("\ntype="+type);//测试
		HttpSession session = request.getSession();
		if ("login".equals(type)) {//登录
			String account = request.getParameter("userName");
			String password = request.getParameter("passWord");
			User user = us.login(account, password);//若成功返回该对象,若失败返回null
			if(user == null){
				request.setAttribute("err", "用户名或密码不正确");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}else{
				user.setPassword(null);
				session.setAttribute("user", user);
				request.getRequestDispatcher("reg-result.jsp").forward(request, response);
			}
		}else if("register".equals(type)){//注册
			User user = new User();
			user.setAccount(request.getParameter("userName"));
			user.setPassword(request.getParameter("passWord"));
			if(us.register(user)){//方法返回是否注册成功
				request.getRequestDispatcher("reg-result.jsp").forward(request, response);
			}else{
				request.setAttribute("err", "用户名已存在");
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}
			
		}else if("indexClass".equals(type)){//index.jsp显示列表
			SmallclassService smallclassService = new SmallclassServiceImpl();
			BigclassService bigclassService = new BigclassServiceImpl();
			session.setAttribute("blist", bigclassService.selectAll());//大分类存入会话
			session.setAttribute("slist", smallclassService.selectAll());//小分类存入会话
			response.sendRedirect("index.jsp");
		}else if("logout".equals(type)){//登出
			session.removeAttribute("user");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else if("index".equals(type)){//index.jsp显示商品
			GoodsService goodsService = new GoodsServiceImpl();
			List<Goods> glist = goodsService.select(8);
			request.setAttribute("glist", glist);//商品存入request
			List<Goods> Hglist = goodsService.select(12);
			request.setAttribute("Hglist", Hglist);//商品存入request
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
