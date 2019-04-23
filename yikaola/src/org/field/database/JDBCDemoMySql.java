package org.field.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCDemoMySql {
	private static final String URL = "jdbc:mysql://localhost:3306/wyy";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";

	public static void update() {// 查
		Connection conn = null;
		Statement stmt = null;
		ResultSet res = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.createStatement();
			// String sql =
			// "INSERT INTO `xz_user` (`uid`, `uname`, `upwd`) VALUES ('4', 'dangdang', '123456') ";
			String name = "d";
			String sql = "select * from xz_user where uname like '%"+name+"%'";
			res = stmt.executeQuery(sql);
			// 处理结果
			while (res.next()) {
				//int uid = res.getInt("uid");
				//String uname = res.getString("uname");
				int uid = res.getInt(1);
				String uname = res.getString(2);
				System.out.println(uid+"----"+uname);
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {// 根异常
			e.printStackTrace();
		} finally {
			try {
				if (res != null) {
					res.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		update();
	}
}
