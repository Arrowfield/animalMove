package org.field.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.field.bean.Login;

public class LoginDao {
	public static int login(Login login){
		int  result = -1;
		@SuppressWarnings("unused")
		int flag = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		try{
			Class.forName("com.mysql.jdbc.Driver");
			 conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/wyy","root","root");
			String sql = "select count(*) from xz_user where tel = ?";
			pstmt = conn.prepareStatement(sql);
			//缺少手机号码
			pstmt.setString(1, login.getTel());
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
			if(result>0){
				return 1;
			}else{
				return 0;//用户名和密码错误
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
			return -1;//
		}catch(SQLException e){
			e.printStackTrace();
			return -1;//
		}catch(Exception e){
			e.printStackTrace();
			return -1;//
		}finally{
			try{
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(conn != null){conn.close();}
			}catch(SQLException e){
				e.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}
