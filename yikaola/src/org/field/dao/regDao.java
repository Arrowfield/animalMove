package org.field.dao;


import java.util.Date;
import java.text.SimpleDateFormat;

import org.field.bean.Login;

public class regDao {
	public static boolean reg(Login login) {
		DB db = new DB();
		Date now = new Date();
 		SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql = "INSERT INTO `t_khb`(`uid`, `username`, `tel`, `password`, `passwordAgain`,`sex`,`registerTime`) VALUES (NULL,NULL,?,NULL,NULL,NULL,?)";
		//构造参数
		Object[] obj = {login.getTel(),matter.format(now)};
		return db.executeUpdate(sql,obj);
		
	}

}
