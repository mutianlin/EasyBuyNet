package com.eleven.test;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Scanner;

import com.eleven.dao.impl.BuycarDaoImpl;
import com.eleven.entity.Goods;
import com.eleven.service.impl.GoodsServiceImpl;

public class Test {

	public static void main(String[] args) {
		try {
//			Scanner in = new Scanner(System.in);//控制台输入会默认转码，鬼知道转的什么编码
//			String a = in.next();
//			System.out.println(a);
			String b = URLEncoder.encode("乱码", "utf-8");
			System.out.println(b);
			String e = URLEncoder.encode("乱码", "gbk");
			System.out.println(e);
			String q = URLEncoder.encode("乱码", "utf-16");
			System.out.println(q);
			String d = URLEncoder.encode("乱码", "ISO-8859-1");
			System.out.println(d);
			String c = URLDecoder.decode(b,"utf-8");
			System.out.println(c);
//			
//			GoodsServiceImpl gs = new GoodsServiceImpl();
//			BuycarDaoImpl bs = new BuycarDaoImpl();
//			
//			Goods g = gs.selectById(8);
//			bs.addGoods(1, g);
//			
//			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
