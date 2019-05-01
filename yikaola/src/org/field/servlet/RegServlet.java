package org.field.servlet;




import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session = request.getSession();
		
		String codeSession = (String) session.getAttribute("code");
		
		
		if(phone.length() == 0) {
			json.put("code", 301);
			json.put("message", "手机号不可以为空");
			response.getWriter().print(json.toString());
			return;
		}

		if(code.length() == 0) {
			json.put("code", 302);
			json.put("message", "验证码不可以为空");
			response.getWriter().print(json.toString());
			return;
		}
		
		
		if(Integer.parseInt(code) != Integer.parseInt(codeSession)){
			json.put("code", 303);
			json.put("message", "验证码输入错误");
			response.getWriter().print(json.toString());
			return;
		}
		
		Login reg = new Login(phone,code);
		
		boolean result = regDao.reg(reg);
		
		
		if(result){
			json.put("code", 200);
			json.put("message", "注册成功");
			response.getWriter().print(json.toString());
		}else {
			json.put("code", 400);
			json.put("message", "服务器崩溃");
			response.getWriter().print(json.toString());
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
