package org.field.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
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



	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//鏁版嵁
		/*
		 * code = 200
		 * message = "璇锋眰鎴愬姛"
		 * data = {goods:[{},{}],sellHot:[],}
		 *
		 * */
		/*鑾峰彇鏁版嵁搴撲腑鐨勬暟鎹�*/
		Goods [] goods;
		DB db = new DB();
		String sql = "select * from t_spb";
		Object[] params = null;
		db.doPstm(sql, params);
		ResultSet rs = db.getRs();
		
		LinkedList<Goods> myGoods = new LinkedList<Goods>();
		
		
		HashMap<String,Goods> hashgoods = new HashMap<String,Goods>(); 
		
		//System.out.print(rs);
		
		try {
			rs.last();
			int lastNumber = rs.getRow();

			//System.out.print(rs.getRow()+10);
			
			goods = new Goods[lastNumber];
			
			for(int i = 0;i<lastNumber;i++) {
				
				rs.absolute(i+1);
				
				goods[i] = new Goods(
						
						rs.getInt(1),
						
						rs.getString(2),
						
						rs.getInt(3),
						
						rs.getDouble(4),
						
						rs.getDouble(5),
						
						rs.getString(6),
						
						rs.getString(7),
						
						rs.getInt(8));
				
				myGoods.add(goods[i]);
				
				
			}
			
			while(rs.next()) {
				//int id = rs.getInt(1);
				//System.out.print("\n"+id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//System.out.print(myGoods);
		
		
		//System.out.print(myGoods);
		
		//Goods [] goodsYouLove = new Goods[10];
//		
//		Goods goods01 = new Goods(1,"鐗欒啅",5.20,"/storage/01.png","濂借揣");
//		Goods goods02 = new Goods(2,"鐗欒啅",5.20,"/storage/01.png","濂借揣");
//		Goods goods03 = new Goods(3,"鐗欒啅",5.20,"/storage/01.png","濂借揣");
//		Goods goods04 = new Goods(4,"鐗欒啅",5.20,"/storage/01.png","濂借揣");
//		Goods goods05 = new Goods(5,"鐗欒啅",5.20,"/storage/01.png","濂借揣");
//		Goods goods06 = new Goods(6,"鐗欒啅",5.20,"/storage/01.png","濂借揣");
//		Goods goods07 = new Goods(7,"鐗欒啅",5.20,"/storage/01.png","濂借揣");
		
		
		
		
//		goods[0] = goods01;
//		goods[1] = goods02;
//		goods[2] = goods03;
//		goods[3] = goods04;
//		goods[4] = goods05;
//		goods[5] = goods06;
//		goods[6] = goods07;
		
		JSONObject json = new JSONObject();
		json.put("code", 200);
		json.put("msg", "鏁版嵁鑾峰彇鎴愬姛");
		json.put("data",myGoods);
		json.put("goods",hashgoods);
		response.getWriter().print(json.toString());
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
