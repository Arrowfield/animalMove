package org.field.example;

import net.sf.json.JSONObject;

public class GetJsonData {

	public static void main(String[] args) {
		JSONObject json = new JSONObject();
		json.put("uname", "zhangsan");
		json.put("upwd", "123456");
		System.out.print(json.toString());
	}

}
