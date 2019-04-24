package org.field.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.field.bean.Login;
import org.field.dao.IsLoginDao;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class IsLogin extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String tel = (String) session.getAttribute("tel");
		
		
		JSONObject json = new JSONObject();
		if (tel != null) {
			Login login = new Login(tel);
			//{code:200,msg:"用户已经登录",tel:tel}
			String uname = IsLoginDao.login(login);
			json.put("code", "200");
			json.put("msg", "用户已经登录");
			json.put("tel", tel);
			json.put("uname", uname);
			response.getWriter().print(json.toString());
		} else {
			//{code:301,msg:"用户未登录"}
			json.put("code", "301");
			json.put("msg", "用户为登录");
			response.getWriter().print(json.toString());
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
