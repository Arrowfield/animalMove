package org.field.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class ExitServlet extends HttpServlet {

	
	public ExitServlet() {
		super();
	}

	
	@Override
	public void destroy() {
		super.destroy(); 
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//让session失效
		HttpSession session = request.getSession();
		session.removeAttribute("tel");
		JSONObject json = new JSONObject();
		json.put("code", "200");
		json.put("msg", "用户已经注销");
		response.getWriter().print(json.toString());
	
	}

	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);

	}

	@Override
	public void init() throws ServletException {
	
	}

}
