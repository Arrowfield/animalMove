package org.field.dao;

import org.field.bean.Login;

public class regDao {
	public static int reg(Login login) {
		String phone = login.getTel();
		//String code = login.getCode();
		DB db = new DB();
		db.getCon();
		
		return 0;
	}

}
