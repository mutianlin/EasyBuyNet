package com.eleven.util;

//import java.lang.reflect.Field;
//import java.lang.reflect.Method;
import java.sql.*;
import java.util.List;

//import javax.naming.Context;
//import javax.naming.InitialContext;
//import javax.sql.DataSource;

public class DbUtil {
	private static Connection conn = null;
	private static PreparedStatement pst = null;
	private static ResultSet rs = null;

	// 普通jdbc
	 private static final String driver = "com.mysql.jdbc.Driver";
	 private static final String url = "jdbc:mysql://localhost:3306/easybuynet";
	 private static final String username = "root";
	 private static final String password = "root";

	public static Connection getConnection() {
		try {
			// 连接池
//			Context ct = new InitialContext();
//			DataSource ds = (DataSource) ct.lookup("java:comp/env/jdbc/easybuynet");
//			conn = ds.getConnection();
			// 普通jdbc
			 Class.forName(driver);
			 conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
//			e.printStackTrace();
		}
		return conn;
	}

	public static ResultSet executeQuery(String sql, List<Object> list) {
		try {
			pst = getConnection().prepareStatement(sql);
			for (int i = 0; i < list.size(); i++) {
				pst.setObject(i + 1, list.get(i));
			}
			rs = pst.executeQuery();
		} catch (SQLException e) {
//			e.printStackTrace();
		}
		return rs;
	}

	public static int executeUpdate(String sql, List<Object> list) {
		int num = 0;
		try {
			pst = getConnection().prepareStatement(sql);
			for (int i = 0; i < list.size(); i++) {
				pst.setObject(i + 1, list.get(i));
			}
			num = pst.executeUpdate();
		} catch (SQLException e) {
//			e.printStackTrace();
		} finally {
			closeAll();
		}
		return num;
	}

	public static void closeAll() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
//				e.printStackTrace();
			}
		}

		if (pst != null) {
			try {
				pst.close();
			} catch (SQLException e) {
//				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
//				e.printStackTrace();
			}
		}

	}
}
