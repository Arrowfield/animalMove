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
 * Servlet implementation class OrderSearch
 */
public class OrderSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderSearch() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings({ "unused", "unchecked", "rawtypes" })
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		JSONObject json = new JSONObject();

		String keyword = request.getParameter("keyword");

		String key = new String(keyword.getBytes("ISO-8859-1"), "UTF-8");

		System.out.print(key + "\n");
		
		HttpSession session = request.getSession();
		
		String tel = (String) session.getAttribute("tel");

		DB db = new DB();
		
		String sql = "";
		

		if (key != null) {

			//sql = "SELECT * FROM `t_order` WHERE `goodname` like '%' ? '%' ";
			
			
			sql = "select * from t_order as t_o left join t_spb  as t_s  on  t_o.s_id = t_s.sid where t_s.sname like '%' ? '%' and t_o.phone = ?";

			
		}else {
			
			//sql = "SELECT * FROM `t_khdgb` WHERE !?";
			
			
			sql = "select * from t_order as t_o left join t_spb  as t_s  on  t_o.s_id = t_s.sid where !? and t_o.phone = ?";
			
		}
		
		Object[] params = {key,tel};

		db.doPstm(sql, params);

		//LinkedList<Object> order = new LinkedList<Object>();

		ResultSet rs = db.getRs();
		
		List order = new ArrayList();
		
		try {
			
			ResultSetMetaData rsmd = rs.getMetaData();
			
			/*rs.last();

			int last = rs.getRow();

			if (last == 0) {

				json.put("code", 301);

				response.getWriter().print(json.toString());

				return;
			}
				
			rs.first();*/
			 
			
			while(rs.next()) {
				
				
				@SuppressWarnings("rawtypes")
				
				Map m = new HashMap();
				
				for(int j = 1;j <= rsmd.getColumnCount();j++) {
					
					String colName = rsmd.getColumnName(j);
					
					//System.out.print(colName);
					
					m.put(colName, rs.getString(colName));
				}
				
				order.add(m);
				
			}
			
		} catch (SQLException e) {
			
			
			e.printStackTrace();
		} 
		

		/*try {

			rs.last();

			int last = rs.getRow();

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

			// System.out.print(last);

		} catch (Exception e) {

			e.printStackTrace();
		}*/

		json.put("data", order);

		json.put("code", 200);

		response.getWriter().print(json.toString());
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
