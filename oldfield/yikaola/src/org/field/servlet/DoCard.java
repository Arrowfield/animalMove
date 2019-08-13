package org.field.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.field.dao.DB;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class DoCard
 */
public class DoCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoCard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		JSONObject json = new JSONObject();
		HttpSession session = request.getSession();
		
		String tel = (String) session.getAttribute("tel");
		
		DB db = new DB();
		
		String sql = "SELECT * FROM `t_docard` WHERE `tel` = ?";
		
		Object[] params = {tel};
		
		
		
		db.doPstm(sql, params);
		
		ResultSet rs = db.getRs();
		
		//System.out.print(rs);
		
		try {
			int num;
			
			while(rs.next()) {
				num = rs.getInt("num");
				json.put("num", num);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		json.put("code", 200);
		
		//获取当前用户的签到次数
		response.getWriter().print(json.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
