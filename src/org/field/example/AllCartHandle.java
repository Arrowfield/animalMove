package org.field.example;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.field.dao.DB;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class AllCartHandle
 */
public class AllCartHandle extends BaseServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**  
     * @see HttpServlet#HttpServlet()
     */
    public AllCartHandle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//鎿嶄綔淇敼
		
		//String id = request.getParameter("id");
		
		//String price = request.getParameter("price");
		
		//String num = request.getParameter("num");
		
		//HttpSession session = request.getSession();
		
		//String tel = (String)session.getAttribute("tel");
		
		//System.out.printf("%s,%s,%s",id,price,num);
		
		//float sum = Float.parseFloat(price) * Float.parseFloat(num);
		
		//DB db = new DB();
		
		//String sql = "update t_khdgb set number = ? , sum = ?  where kid = ? and tel = ?";
		
		//Object[] params = {num,sum,id,tel};
		
		//boolean boo = db.executeUpdate(sql, params);
		
		//System.out.print(bool);
		
		response.getWriter().append("Served at:update ").append(request.getContextPath());
	
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		JSONObject json = new JSONObject();
		
		String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		
		String tel = (String)session.getAttribute("tel");
		
		DB db = new DB();
		
		String sql = "delete from t_khdgb where tel = ? and kid = ?";
		
		Object[] params = {tel,id};
		
		boolean bool = db.executeUpdate(sql, params);
		
		if(bool) {
			
			json.put("code", 200);
			
			json.put("message", "鍒犻櫎鎴愬姛");
			
			response.getWriter().print(json.toString());
		}else {
			
			json.put("code", 401);
			
			json.put("message", "鍒犻櫎澶辫触");
			
			response.getWriter().print(json.toString());
			
		}
		
	}
	
	//鎿嶄綔淇敼鐘舵��
	
	public void status(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String status = request.getParameter("status");
		
		String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		
		String tel = (String)session.getAttribute("tel");
		
		String statusAll = request.getParameter("statusAll");
		
		DB db = new DB();
		
		boolean bool;
		
		if(statusAll != null) {
			
			//status = statusAll;
			
			String sql = "update t_khdgb set status = ? where tel = ?";//璐墿杞﹁〃鐨勮嚜澧濱D
			
			Object[] params = {statusAll,tel};
			
			bool = db.executeUpdate(sql, params);
			
		}else {
			
			
			String sql = "update t_khdgb set status = ? where kid = ? and tel = ?";//璐墿杞﹁〃鐨勮嚜澧濱D
			
			Object[] params = {status,id,tel};
			
			bool = db.executeUpdate(sql, params);
			
		}
		
		JSONObject json = new JSONObject();
		
		
		if(bool){
			
			json.put("code", 200);
			
			json.put("message", "鏇存柊鎴愬姛");
			
			response.getWriter().print(json.toString());
		}else {
			
			json.put("code", 401);
			
			json.put("message", "鏇存柊澶辫触");
			
			response.getWriter().print(json.toString());
		}
		
	}

}
