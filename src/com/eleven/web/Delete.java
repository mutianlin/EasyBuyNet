package com.eleven.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eleven.service.BigclassService;
import com.eleven.service.SmallclassService;
import com.eleven.service.impl.BigclassServiceImpl;
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
			int number = smallclassService.queryByBId(id);
			if (number > 0) {
				out.print(number);
				out.flush();
				out.close();
			} else {
				bigclassService.delete(id);
			}
		}

		if ("doBClassD".equals(deleteType)) {
			bigclassService.delete(id);
			response.sendRedirect("adminServlet?type=productClass");
		}
	}
}
