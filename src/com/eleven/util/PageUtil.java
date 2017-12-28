package com.eleven.util;

import java.util.ArrayList;
import java.util.List;

public class PageUtil {
	private int wantPage;//现在所在页
	private int pageNum = 10;//每页10条数据
	private int allPageNum;//总页数
	private int allDateNum;//总数据数

	public int getWantPage() {
		return wantPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getAllPageNum() {
		return allPageNum;
	}

	public int getAllDateNum() {
		return allDateNum;
	}

	public List<Object> page(int wantPage){
		List<Object> list = new ArrayList<Object>();
		
		
		return list;
	}
}
