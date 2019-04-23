package org.field.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class JsonDemo extends HttpServlet {

	public JsonDemo() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		JSONObject jsonobj = new JSONObject();
		// JSONArray jsonarray = new JSONArray();
		jsonobj.put("管理员", "zhangsan");
		jsonobj.put("密码", "123456");
		jsonobj.put("等级", "123");
		// jsonarray.add(jsonobj);
		out.println(jsonobj);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
