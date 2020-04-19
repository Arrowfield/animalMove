package org.field.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Calendar;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.field.dao.DB;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class AddCard
 */
public class AddCard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCard() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		JSONObject jsonObject = new JSONObject();

		String numString = request.getParameter("num");

		HttpSession session = request.getSession();

		String tel = (String) session.getAttribute("tel");

		// 濡傛灉鏄涓�娆¤姹傚氨鎵ц鎻掑叆鎿嶄綔

		DB db = new DB();

		String sqlString = null;

		//Object[] paramsObjects = null;

		int num = Integer.parseInt(numString);

		num++;

		
		
		/*
		 * 鐢ㄦ埛褰撳ぉ鐐瑰嚮鑾峰彇鏃堕棿
		 * */
		
		//sqlString = "SELECT * FROM `t_khb` WHERE 1";
		

		if (Integer.parseInt(numString) == 0) {

			sqlString = "INSERT INTO `t_docard`(`id`, `user_id`, `num`, `time`, `tel`) VALUES (null,null,?,?,?)";

			//Object[] paramsObjects = {num,timeString,tel};
			
			//boolean boo = db.executeUpdate(sqlString, paramsObjects);
			

		}else {
			
			sqlString = "SELECT `time` FROM `t_docard` WHERE `tel` = ?";
			
			Object[] params = {tel};
			
			db.doPstm(sqlString, params);
			
			ResultSet rs = db.getRs();
			
			try {
				//System.out.print(rs);
				while(rs.next()) {
					String time = rs.getString(1);
					
					Calendar c = Calendar.getInstance();
					
					int day = c.get(Calendar.DAY_OF_MONTH);
					
					//System.out.print(day);
					
					String str = time.split(" ")[0].toString().split("-")[2].toString();
					
					System.out.print(str);
					
					if(Integer.parseInt(str) == day) {
						
						jsonObject.put("code", 301);
						
						response.getWriter().print(jsonObject.toString());
						
						return;
					};
					
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			sqlString = "UPDATE `t_docard` SET `num`= ? ,`time` = ? ,`tel`= ?  WHERE `tel` = ?";
			
			//Object[] paramsObjects = {num,timeString,tel,tel};
			
			//boolean boo = db.executeUpdate(sqlString, paramsObjects);
			
			//System.out.print(bool);
		}

		// 濡傛灉鏄浜屾灏辨墽琛屾洿鏂版搷浣�

		// String sqlString = "";

		jsonObject.put("num", num);

		jsonObject.put("code", 200);

		response.getWriter().print(jsonObject.toString());
		;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
