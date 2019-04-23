package cn.com.database;
//导入sql包
import java.sql.*;
//创建实例对象用来验证是否封装数据库成功
public class JDBCTest{
    public static void main(String[] args) throws Exception{      
    	Database db = new Database();
    	Connection conn = db.$();
    	Statement pre = null;
    	String sql = "SELECT * FROM t_khdgb ";
    	pre = conn.createStatement(); 
    	ResultSet  rs = pre.executeQuery(sql);
    	while(rs.next()){
    		System.out.println(rs.getString(4));	
    	}
    }  
} 
