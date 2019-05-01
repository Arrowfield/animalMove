package org.field.servlet;



import java.io.Console;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.field.bean.Login;
import org.field.dao.regDao;

import net.sf.json.JSONObject;

public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		String phone = request.getParameter("phone");
		String code = request.getParameter("code");
		JSONObject json = new JSONObject(); 
		
		if(phone.length() == 0) {
			json.put("code", 301);
			json.put("message", "手机号不可以为空");
			response.getWriter().print(json.toString());
			//System.out.print("012"+phone);
			return;
		}

		if(code.length() == 0) {
			json.put("code", 302);
			json.put("message", "验证码不可以为空");
			response.getWriter().print(json.toString());
			//System.out.print("123"+code);
			return;
		}
		
		Login reg = new Login(phone,code);
		int result = regDao.reg(reg);
		System.out.print(result);
		//System.out.printf(phone,code);;
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
