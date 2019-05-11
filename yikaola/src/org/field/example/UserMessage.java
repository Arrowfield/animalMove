package org.field.example;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.field.dao.DB;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class UserMessage
 */
public class UserMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMessage() {
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
		
		DB db = new DB();
		
		String sql = "select avatar from t_khb where tel = ?";
		
		HttpSession session = request.getSession();
		
		String tel = (String)session.getAttribute("tel");
		
		Object[] params = {tel};
		
		db.doPstm(sql, params);
		
		ResultSet rs = db.getRs();
		
		try {
			while(rs.next()){
				
				String avatar = (String) rs.getObject(1);
				
				json.put("avatar", avatar);
				
				json.put("code", 200);
				
				response.getWriter().print(json.toString());
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
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
