package org.field.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.field.bean.Goods;
import org.field.dao.DB;

import net.sf.json.JSONObject;

public class IndexData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public IndexData() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//数据
		/*
		 * code = 200
		 * message = "请求成功"
		 * data = {goods:[{},{}],sellHot:[],}
		 *
		 * */
		/*获取数据库中的数据*/
		Goods [] goods = new Goods[10];
		DB db = new DB();
		String sql = "select * from t_spb";
		Object[] params = null;
		db.doPstm(sql, params);
		ResultSet rs = db.getRs();
		LinkedList<Goods> myGoods = new LinkedList<Goods>();
		//System.out.print(rs);
		try {
			int lastNumber = rs.getRow();
			for(int i = 1;i<lastNumber;i++) {
				
				goods[i] = new Goods(rs.getInt(1),rs.getString(2),rs.getDouble(3),rs.getString(4),rs.getString(5));
				
				myGoods.add(goods[i]);
			}
			
			while(rs.next()) {
				int id = rs.getInt(1);
				System.out.print("\n"+id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//Goods [] goodsYouLove = new Goods[10];
		
		Goods goods01 = new Goods(1,"牙膏",5.20,"/storage/01.png","好货");
		Goods goods02 = new Goods(2,"牙膏",5.20,"/storage/01.png","好货");
		Goods goods03 = new Goods(3,"牙膏",5.20,"/storage/01.png","好货");
		Goods goods04 = new Goods(4,"牙膏",5.20,"/storage/01.png","好货");
		Goods goods05 = new Goods(5,"牙膏",5.20,"/storage/01.png","好货");
		Goods goods06 = new Goods(6,"牙膏",5.20,"/storage/01.png","好货");
		Goods goods07 = new Goods(7,"牙膏",5.20,"/storage/01.png","好货");
		
		
		
		
		goods[0] = goods01;
		goods[1] = goods02;
		goods[2] = goods03;
		goods[3] = goods04;
		goods[4] = goods05;
		goods[5] = goods06;
		goods[6] = goods07;
		
		JSONObject json = new JSONObject();
		json.put("code", 200);
		json.put("msg", "数据获取成功");
		json.put("data",myGoods);
		response.getWriter().print(json.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
