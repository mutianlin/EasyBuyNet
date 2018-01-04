package com.eleven.test;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Scanner;

public class Test {

	public static void main(String[] args) {
		try {
			Scanner in = new Scanner(System.in);//控制台输入会默认转码，鬼知道转的什么编码
			String a = in.next();
			System.out.println(a);
			String b = URLEncoder.encode("乐扣普通型保鲜盒圣诞7件套", "utf-8");
			System.out.println(b);
			String c = URLDecoder.decode(b,"utf-8");
			System.out.println(c);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
