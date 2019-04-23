package org.field.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.field.bean.Login;

public class IsLoginDao {
	@SuppressWarnings("unused")
	public static String login(Login login){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = "";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/wyy","root","root");
			String sql = "select uname from xz_user where tel = ?";
			pstmt = conn.prepareStatement(sql);
			//缺少手机号码
			pstmt.setString(1, login.getTel());
			rs = pstmt.executeQuery();
			//System.out.print(rs.next());
			if(rs.next()){
				return result = rs.getString(1);
			}else{
				return result = "用户手机号码错误";
			}
			
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
			return "-1";//
		}catch(SQLException e){
			e.printStackTrace();
			return "-1";//
		}catch(Exception e){
			e.printStackTrace();
			return "-1";//
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
