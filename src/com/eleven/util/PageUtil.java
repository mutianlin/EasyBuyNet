package com.eleven.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PageUtil {
	private int wantPage = 1;//现在所在页
	private int pageNum = 10;//每页10条数据
	private int allPageNum;//总页数
	private int allDateNum;//总数据数
/**
 * 初始化时传入表名，初始化allDateNum。
 * @param tableName
 */
	public PageUtil(String tableName){
		String sql = "SELECT COUNT(id) FROM "+tableName;
		List<Object> list = new ArrayList<Object>();
		try {
			allDateNum = DbUtil.executeQuery(sql, list).getInt(1);
		} catch (SQLException e) {
//			e.printStackTrace();
		}
	}
	
	
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

	public ResultSet page(int pageNum,int wantPage){
		ResultSet rs = null;
		allPageNum = allDateNum / pageNum;
		String sql = "";
		List<Object> list = new ArrayList<Object>();
		rs = DbUtil.executeQuery(sql, list);
		
		
		return rs;
	}
	
	public ResultSet page(int wantPage){
		return page(this.pageNum,wantPage);
	}
}
