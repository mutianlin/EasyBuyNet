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
		PrintWriter out = response.getWriter();
		BigclassService bigclassService = new BigclassServiceImpl();
		SmallclassService smallclassService = new SmallclassServiceImpl();
		String deleteType = request.getParameter("deleteType");
		System.out.println(deleteType);
		if ("bClassD".equals(deleteType)) {
			int id = Integer.valueOf(request.getParameter("deleteDataId"));
			int number = smallclassService.queryByBId(id);
			System.out.println(1);
			if (number > 0) {
				System.out.println(number+"1111111111");
				out.write(number);//jquery success ajax servlet 返回数据
				System.out.println(3);
				out.close();
			}else{
				bigclassService.delete(id);
			}
		}
	}
}
