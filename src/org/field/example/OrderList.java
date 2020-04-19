package org.field.example;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.field.dao.DB;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class OrderList
 */
public class OrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		JSONObject json = new JSONObject();

		HttpSession session = request.getSession();

		String tel = (String) session.getAttribute("tel");

		//System.out.print(tel);
		
		//鑾峰彇璁㈠崟

		DB db = new DB();

		//鑱旇〃鏌ヨ锛堟棦鏌ュ嚭鐢ㄦ埛璁㈠崟锛屾湁鏌ュ嚭瀵瑰簲鐨勫晢鍝佷俊鎭級
		
		String sqlTow = "select * from t_order as t_o left join t_spb  as t_s  on  t_o.s_id = t_s.sid where t_o.phone = ?";
		
		Object[] paramsTow = {tel};
		
		db.doPstm(sqlTow, paramsTow);
		
		ResultSet res = db.getRs();
		
		@SuppressWarnings("rawtypes")
		
		List list = new ArrayList();
		
		try {
			
			
			
			ResultSetMetaData rsmd = res.getMetaData();
			
			while(res.next()) {
				
				@SuppressWarnings("rawtypes")
				
				Map m = new HashMap();
				
				for(int j = 1;j <= rsmd.getColumnCount();j++) {
					
					String colName = rsmd.getColumnName(j);
					
					//System.out.print(colName);
					
					m.put(colName, res.getString(colName));
				}
				
				list.add(m);
				
			}
			
		} catch (SQLException e1) {

			e1.printStackTrace();
		}
		
		json.put("newData", list);
		
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
							rs.getObject(7) 
							
					};

					order.add(newsObjects);
				}
			}

			System.out.print(last);

		} catch (Exception e) {

			e.printStackTrace();
		}

		json.put("code", 200);

		// 鑾峰彇褰撳墠鐢ㄦ埛鐨勭鍒版鏁�

		json.put("data", order);

		response.getWriter().print(json.toString());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
