package com.eleven.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eleven.entity.Goods;
import com.eleven.entity.User;
import com.eleven.service.BuycarService;
import com.eleven.service.GoodsService;
import com.eleven.service.impl.BuycarServiceImpl;
import com.eleven.service.impl.GoodsServiceImpl;

public class GoodsServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		GoodsService gs = new GoodsServiceImpl();
		BuycarService bs = new BuycarServiceImpl();
		String type = request.getParameter("type");
		User user = (User) session.getAttribute("user");
		if ("buycar".equals(type)) {//购物车
			if (user == null) {//如果没登录
				response.sendRedirect("login.jsp");
			} else {
				request.setAttribute("blist", bs.selectByUser(user.getId()));
				request.getRequestDispatcher("shopping.jsp").forward(request,
						response);
			}
		} else if ("goods".equals(type)) {//商品详细信息
			int id = Integer.valueOf(request.getParameter("id"));
			request.setAttribute("goods", gs.selectById(id));
			request.getRequestDispatcher("product-view.jsp").forward(request,
					response);
		}else if("addBuycar".equals(type)){//购物车添加
			int userId = Integer.valueOf(request.getParameter("user"));
			int gid = Integer.valueOf(request.getParameter("goods"));
			Goods g = gs.selectById(gid);
			bs.addGoods(userId, g);
			response.sendRedirect("goodsServlet?type=goods&id="+gid);
		}
	}

}
