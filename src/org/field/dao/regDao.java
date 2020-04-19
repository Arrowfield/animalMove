package org.field.dao;

import java.util.Date;
import java.util.Random;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.field.bean.Login;

public class regDao {
	public static int reg(Login login) {
		DB db = new DB();
		String mysql;
		// 鍒ゆ柇鐢ㄦ埛鏄惁宸插瓨鍦ㄦ暟鎹簱涓�
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
		// 灏嗘柊鐢ㄦ埛鎻掑叆鏁版嵁搴�

		Date now = new Date();
		SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		mysql = "INSERT INTO `t_khb`(`uid`, `username`, `tel`, `password`, `passwordAgain`,`sex`,`registerTime`) VALUES (NULL,?,?,NULL,NULL,NULL,?)";
		// 鏋勯�犲弬鏁�
		Object[] obj = { getRandomName(20), login.getTel(), matter.format(now) };
		boolean bool = db.executeUpdate(mysql, obj);
		if (bool) {
			return 1;// 姣忎竴娆eturn缁撴潫灏遍��鍑�
		}
		return 0;
	}

	public static String getRandomName(int len) {
		String val = "";
		Random random = new Random();

		// 鍙傛暟length锛岃〃绀虹敓鎴愬嚑浣嶉殢鏈烘暟
		for (int i = 0; i < len; i++) {

			String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
			// 杈撳嚭瀛楁瘝杩樻槸鏁板瓧
			if ("char".equalsIgnoreCase(charOrNum)) {
				// 杈撳嚭鏄ぇ鍐欏瓧姣嶈繕鏄皬鍐欏瓧姣�
				int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
				val += (char) (random.nextInt(26) + temp);
			} else if ("num".equalsIgnoreCase(charOrNum)) {
				val += String.valueOf(random.nextInt(10));
			}
		}
		return val;

	}

}
