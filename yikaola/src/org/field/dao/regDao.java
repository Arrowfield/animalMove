package org.field.dao;

import java.sql.ResultSet;
import org.field.bean.Login;

public class regDao {
	public static int reg(Login login) {
		DB db = new DB();
		String sql = "INSERT INTO `t_khb`(`uid`, `username`, `tel`, `password`, `passwordAgain`) VALUES (NULL,NULL,?,NULL,NULL)";
		//构造参数
		Object[] obj = {login.getTel()};
		db.executeUpdate(sql,obj);
		ResultSet rs = db.getRs();
		System.out.print(rs);
		return 0;
	}

}
