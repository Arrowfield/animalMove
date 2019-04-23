package cn.com.database;
import java.sql.*;

public class Database {
	private  String driver =  "com.mysql.jdbc.Driver";
	private  String url =  "jdbc:mysql://localhost:3306/d_easyBuy"; 
	private  String user =  "root"; 
	private  String pwd =  "";
	//创建数据库对象
	private Connection conn = null;
	//创建实例方法
	public Connection $() throws Exception{
		//加载驱动
		try{
			Class.forName(driver);
		}catch(Exception e){
			throw e;
		}
		try{
			conn = DriverManager.getConnection(url,user,pwd);
		}catch(Exception e){
			throw e;
		}
		return conn;
	}
	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}//访问器属性？
}
