package cn.com.database;

import java.sql.*;

//创建类
public class ConnectionDb {
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/d_easybuy";
	private String user = "root";
	private String pwd = "";
	private Connection conn;

	// 创建数据库对象
	public Connection getConnection() {// 创建构造函数
		// 加载数据库驱动
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		// 创建数据库对象
		try {
			conn = DriverManager.getConnection(url, user, pwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
