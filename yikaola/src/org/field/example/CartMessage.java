package org.field.example;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.field.dao.DB;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class CartMessage
 */
public class CartMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartMessage() {
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

		//System.out.print(tel);

		DB db = new DB();

		String sql = "SELECT * FROM `t_khdgb` WHERE `tel` = ?";

		Object[] params = { tel };

		db.doPstm(sql, params);

		LinkedList<Object> order = new LinkedList<Object>();

		ResultSet rs = db.getRs();

		try {

			rs.last();

			int last = rs.getRow();

			//System.out.print(last);

			if (last == 0) {

				json.put("code", 301);
				
				json.put("message", "获取信息失败");

				response.getWriter().print(json.toString());

				return;
				
			} else {

				for (int i = 0; i < last; i++) {

					rs.absolute(i + 1);

					Object[] newsObjects = { 
							
							rs.getObject(1), 
							rs.getObject(2), 
							rs.getObject(3), 
							rs.getObject(4),
							rs.getObject(5), 
							rs.getObject(6), 
							rs.getObject(7),
							rs.getObject(8), 
							rs.getObject(9),
							rs.getObject(10),
							
					};

					order.add(newsObjects);
				}
			}

			System.out.print(last);

		} catch (Exception e) {

			e.printStackTrace();
		}

		json.put("code", 200);

		// 获取当前用户的签到次数

		json.put("data", order);

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
