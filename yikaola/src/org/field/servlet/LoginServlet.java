package org.field.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
//import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.field.bean.Login;
import org.field.dao.LoginDao;

//版本：2.5 (servlet)
@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
	
	private String code;
	
	public void init() throws ServletException {
		//System.out.println("init...");
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取验证码

		response.setCharacterEncoding("utf-8");
		response.setHeader("centent-type", "text/html;charset=utf-8");
		code = randomCode();
		String data = code;
		OutputStream out = response.getOutputStream();
		out.write(data.getBytes("utf-8"));
	}
	
	public Boolean checkLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Boolean flag = false;
		return flag;
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		String tel = request.getParameter("uname"); //接受电话参数[表单提交时]
		String RCode = request.getParameter("code");//接受验证码[表单提交时]
		
		
		JSONObject json = null;
		if(tel != null && code != null){ 
			Login login =  new Login(tel);
			boolean bool = Integer.parseInt(code) == Integer.parseInt(RCode);
			//调用模型层的登录功能
			int result = LoginDao.login(login);
			if(result > 0 && bool ){
				//构建session
				json = new JSONObject();
				json.put("code", 200);
				json.put("msg", "密码正确，进入首页");
				HttpSession session = request.getSession();
				session.setAttribute("tel", tel);
				response.getWriter().print(json.toString());
				//密码正确
			}else if(result == 0){
				json = new JSONObject();
				json.put("code", 201);
				json.put("msg", "用户名或密码错误");
				//response.sendRedirect("login.jsp");//用户名或密码错误
				response.getWriter().print(json.toString());
			}else{//小于0时 系统异常
				json = new JSONObject();
				json.put("code", 202);
				json.put("msg", "系统异常");
				//response.sendRedirect("login.jsp");
				response.getWriter().print(json.toString());
			}
		}else{
				json = new JSONObject();
				json.put("code", 203);
				json.put("msg", "系统异常...");
				//response.sendRedirect("login.jsp");
				response.getWriter().print(json.toString());
		}
	}
	
	//servlet销毁
	public void destroy() {
		System.out.println("destroy...");
	}
	
	public static String randomCode(){
		StringBuilder str = new StringBuilder();
		Random random = new Random();
		for(int i = 0;i<6;i++){
			str.append(random.nextInt(10));
		}
		return str.toString();
	}

}
