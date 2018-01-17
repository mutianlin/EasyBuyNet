package com.eleven.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eleven.service.BigclassService;
import com.eleven.service.GoodsService;
import com.eleven.service.SmallclassService;
import com.eleven.service.impl.BigclassServiceImpl;
import com.eleven.service.impl.GoodsServiceImpl;
import com.eleven.service.impl.SmallclassServiceImpl;

public class Delete extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// request.setCharacterEncoding("UTF-8");//编码统一
		// response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();// 定义返回给ajax的对象
		BigclassService bigclassService = new BigclassServiceImpl();
		SmallclassService smallclassService = new SmallclassServiceImpl();
		int id = Integer.valueOf(request.getParameter("deleteDataId"));
		String deleteType = request.getParameter("deleteType");
		System.out.println(deleteType);
		if ("bClassD".equals(deleteType)) {
			int number = smallclassService.queryByBId(id);//小分类中有几个属于该大分类的
			if (number > 0) {
				out.print(number);
				out.flush();
				out.close();
			} else {
				bigclassService.delete(id);//删除大分类时同时删除隶属该分类的小分类
			}
		}else if ("sClassD".equals(deleteType)){
			GoodsService goodsService  = new GoodsServiceImpl();
			int number = goodsService.queryByBGs_id(id);
//			System.out.println(number);
			if (number > 0) {
				out.print(number);
				out.flush();
				out.close();
			} else {
				smallclassService.delete(id);//小分类时同时删除隶属该分类的商品
			}
		}

		if ("do_bClassD".equals(deleteType)) {
			bigclassService.delete(id);
			response.sendRedirect("adminServlet?type=productClass");
		}else if ("do_sClassD".equals(deleteType)) {
			smallclassService.delete(id);
			response.sendRedirect("adminServlet?type=productClass");
		}
	}
	
}
