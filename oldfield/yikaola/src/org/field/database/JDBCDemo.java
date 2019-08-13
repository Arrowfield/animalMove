package org.field.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCDemo {
	private static final String URL = "jdbc:mysql://localhost:3306/wyy";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";

	public static void update() {// 增删改
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.createStatement();
			String sql = "update xz_user set upwd = '456789' where uid = 3";
			int count = stmt.executeUpdate(sql);
			// 处理结果
			if (count > 0) {
				System.out.println("操作成功");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {// 根异常
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		update();
	}
}
