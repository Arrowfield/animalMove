package org.field.dao;


import org.field.bean.Login;

public class regDao {
	public static boolean reg(Login login) {
		DB db = new DB();
		String sql = "INSERT INTO `t_khb`(`uid`, `username`, `tel`, `password`, `passwordAgain`) VALUES (NULL,NULL,?,NULL,NULL)";
		//构造参数
		Object[] obj = {login.getTel()};
		return db.executeUpdate(sql,obj);
		
	}

}
