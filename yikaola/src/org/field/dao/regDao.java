package org.field.dao;

import java.util.Date;
import java.util.Random;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.field.bean.Login;

public class regDao {
	public static int reg(Login login) {
		DB db = new DB();
		String mysql;
		// 判断用户是否已存在数据库中
		mysql = "SELECT * FROM `t_khb` WHERE `tel` = ?";
		Object[] params = { login.getTel() };
		db.doPstm(mysql, params);
		ResultSet rs = db.getRs();
		// System.out.printf(login.getTel()+"\n",rs+"\n");
		try {
			int id = 0;
			while (rs.next()) {
				id = rs.getInt(1);
				// System.out.print(id);
			}

			if (id > 0) {
				return -1;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		// 将新用户插入数据库

		Date now = new Date();
		SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		mysql = "INSERT INTO `t_khb`(`uid`, `username`, `tel`, `password`, `passwordAgain`,`sex`,`registerTime`) VALUES (NULL,?,?,NULL,NULL,NULL,?)";
		// 构造参数
		Object[] obj = { getRandomName(20), login.getTel(), matter.format(now) };
		boolean bool = db.executeUpdate(mysql, obj);
		if (bool) {
			return 1;// 每一次return结束就退出
		}
		return 0;
	}

	public static String getRandomName(int len) {
		String val = "";
		Random random = new Random();

		// 参数length，表示生成几位随机数
		for (int i = 0; i < len; i++) {

			String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
			// 输出字母还是数字
			if ("char".equalsIgnoreCase(charOrNum)) {
				// 输出是大写字母还是小写字母
				int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
				val += (char) (random.nextInt(26) + temp);
			} else if ("num".equalsIgnoreCase(charOrNum)) {
				val += String.valueOf(random.nextInt(10));
			}
		}
		return val;

	}

}
