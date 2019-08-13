package org.field.example;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.field.dao.DB;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class GoodsMessage
 */
public class GoodsMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsMessage() {
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
		
		String sql = "select * from t_spb where sid = ?";
		
		String id = request.getParameter("id");
		
		Object[] params = {id};
		
		db.doPstm(sql, params);
		
		ResultSet rs = db.getRs();
		
		
		
		try {
			
			//因为用了javabean，所以才出现键值对
			
			while(rs.next()){
				
				Object[] good = {
						
						rs.getObject(1),
						rs.getObject(2),
						rs.getObject(3),
						rs.getObject(4),
						rs.getObject(5),
						rs.getObject(6),
						rs.getObject(7),
						rs.getObject(8),
				};
				
				String sqlTow = "select * from t_sku where spb_id = ?";
				
				int idTow =  (Integer) rs.getObject(1);
				
				Object[] paramsTow = {idTow};
				
				db.doPstm(sqlTow, paramsTow);
				
				ResultSet rsTow = db.getRs();
				
				
				while(rsTow.next()) {
					
					Object[] sku = {
							
							rsTow.getObject(1),
							rsTow.getObject(2),
							rsTow.getObject(3),
					
					};
					
					/*颜色:1红，2绿，3黄，4蓝*/
					
					//获取商品sku
					
					json.put("sku",sku);
				}
				
				//获取商品信息
				
				json.put("good", good);
				
				
			}
			
			
			json.put("code", 200);
			
			response.getWriter().print(json.toString());
			
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
