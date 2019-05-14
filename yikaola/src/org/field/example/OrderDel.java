package org.field.example;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.field.dao.DB;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class OrderDel
 */
public class OrderDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDel() {
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
		
		String idString = request.getParameter("id");
		
		DB db = new DB();
		
		String sqlString = "delete from t_khdgb where kid = ?";
		
		Object[] params = {idString};
		
		boolean bool = db.executeUpdate(sqlString, params);
		
		if(bool) {
			
			json.put("code", 200);
			
			json.put("message", "删除成功");
			
			response.getWriter().print(json.toString());
			
		}else {
			
			json.put("code", 401);
			
			json.put("message", "删除失败");
			
			response.getWriter().print(json.toString());
			
		}
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
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
