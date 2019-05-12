package org.field.example;

import java.io.IOException;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.field.dao.DB;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class AddCart
 */
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String num = request.getParameter("num");
		
		String price = request.getParameter("price");
		
		String name = request.getParameter("name");
		
		String color = request.getParameter("color");
		
		String size = request.getParameter("size");
		
		HttpSession session = request.getSession();
		
		String tel = (String) session.getAttribute("tel");
		
		//Float sum =num * price;
		
		JSONObject json = new JSONObject();
		
		float sum = Float.parseFloat(num) * Float.parseFloat(price);
		
		
		DB db = new DB();
		
		String sql = "INSERT INTO `t_khdgb`(`kid`, `sid`, `tel`, `goodname`, `number`, `price`, `sum`, `status`,`color`,`size`) VALUES (null,null,?,?,?,?,?,null,?,?)";
		
		Object[] params = {tel,name,num,price,sum,color,size};
		
		boolean bool = db.executeUpdate(sql, params);
		
		if(bool) {
			
			json.put("code", 200);
			
			json.put("message", "添加购物车成功");
			
			response.getWriter().print(json.toString());
			
		}else {
			
			json.put("code", 400);
			
			json.put("message", "添加购物车失败");
			
			response.getWriter().print(json.toString());
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
