package org.field.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

		// 如果是第一次请求就执行插入操作

		DB db = new DB();

		String sqlString = null;

		//Object[] paramsObjects = null;

		Date now = new Date();

		SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		int num = Integer.parseInt(numString);

		num++;

		String timeString = matter.format(now);

		if (Integer.parseInt(numString) == 0) {

			sqlString = "INSERT INTO `t_docard`(`id`, `user_id`, `num`, `time`, `tel`) VALUES (null,null,?,?,?)";

			Object[] paramsObjects = {num,timeString,tel};
			
			boolean bool = db.executeUpdate(sqlString, paramsObjects);
			
			//System.out.print(bool);
		}else {
			sqlString = "UPDATE `t_docard` SET `num`= ? ,`time` = ? ,`tel`= ?  WHERE `tel` = ?";
			
			Object[] paramsObjects = {num,timeString,tel,tel};
			
			boolean bool = db.executeUpdate(sqlString, paramsObjects);
			
			System.out.print(bool);
		}

		// 如果是第二次就执行更新操作

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
