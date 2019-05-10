package org.field.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



import java.sql.Connection;

public class DB {
	
	private String className; // 驱动名
	private String url; // 连接数据库的URL地址
	private String username; // 数据库的用户名
	private String password; // 数据库的密码
	private Connection con; // 数据库连接对象
	private PreparedStatement pstm; // 数据库预编译处理对象

	public DB() {
		className = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://localhost:3306/d_easybuy";
		username = "root";
		password = "root";
		try {
			Class.forName(className);
		} catch (ClassNotFoundException e) {
			System.out.println("加载数据库驱动程序失败！");
			e.printStackTrace();
		}
	}

	public void getCon() {
		try {
			con = DriverManager.getConnection(url, username, password);
			//System.out.println("获取数据库连接成功！");
		} catch (SQLException e) {
			System.out.println("获取数据库连接失败！");
			e.printStackTrace();
		}
	}
	
	public void doPstm(String sql,Object[] params){
        if(sql!=null && !sql.equals("")){
        	
            if(con==null)
                getCon();
            try {
                pstm=con.prepareStatement(sql);
                if(params==null){
                    params=new Object[0];
                }
                for(int i=0;i<params.length;i++){
                	
                	//System.out.print(params[i]);
                	
                    pstm.setObject(i+1,params[i]);
                }
                pstm.executeQuery();
            } catch (SQLException e) {
                System.out.println("调用DB类中doPstm方法时出错！");
                e.printStackTrace();
            }finally {
            	close(null,pstm,con);
			}
        }
    }
	
	public boolean executeUpdate(String sql,Object[] params){
		int count;
		if(sql != null && sql.length() != 0) {
			if(con == null) {
				getCon();
			}
			try {
				pstm = con.prepareStatement(sql);
				for(int i = 0;i<params.length;i++) {
					pstm.setObject(i+1,params[i]);
				}
				count = pstm.executeUpdate();
				
				if(count > 0) {
					return true;
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(null,pstm,con);
			}
		}
		return false;	
	}
	

	public ResultSet getRs(){
        try {            
            return pstm.getResultSet();
        } catch (SQLException e) {
            System.out.println("DB类中的getRs()方法出错！");
            e.printStackTrace();
            return null;
        }
    }
	
	public void close(ResultSet rs,PreparedStatement ps,Connection con) {
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally{
				if(ps!=null){
					try {
						ps.close();
					} catch (SQLException e) {
						
						e.printStackTrace();
					}finally{
						if(con!=null){
							try {
								con.close();
							} catch (SQLException e) {
								
								e.printStackTrace();
							}
						}
					}
				}
			}
		}
	}
	
	
	
}
