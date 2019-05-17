package org.field.example;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

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
		
		String status = request.getParameter("status");
		
		HttpSession session = request.getSession();
		
		String tel = (String) session.getAttribute("tel");
		
		//获取库存量
		
		String count = request.getParameter("count");
		
		String id = request.getParameter("id");
		
		//Float sum =num * price;
		
		JSONObject json = new JSONObject();
		
		float sum = Float.parseFloat(num) * Float.parseFloat(price);
		
		int countTow = Integer.parseInt(count) - Integer.parseInt(num);
		
		DB db = new DB();
		
		String sql = "INSERT INTO `t_khdgb`(`kid`, `sid`, `tel`, `goodname`, `number`, `price`, `sum`, `status`,`color`,`size`) VALUES (null,null,?,?,?,?,?,?,?,?)";
		
		Object[] params = {tel,name,num,price,sum,status,color,size};
		
		boolean bool = db.executeUpdate(sql, params);
		
		
		//同时生成订单
		
		String orderNum = getRandomName(20);
		
		String  s_id = id;
		
		Date now = new Date();
		
		SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String time = matter.format(now);
		
		String phone = tel;
		
		String sqlTowA = "INSERT INTO `t_order`(`id`, `phone`, `time`, `s_id`, `orderNum`,`status`,`num`,`sum`) VALUES (null,?,?,?,?,?,?,?)";
		
		Object[] paramsTowA = {phone,time,s_id,orderNum,0,num,sum};
		
		db.executeUpdate(sqlTowA, paramsTowA);
		
		if(bool) {
			
			
			//修改库存量
			
			String sqlTow = "UPDATE `t_spb` SET `snum` = ? WHERE sid = ?";
			
			Object[] paramsTow = {countTow,id};
			
			boolean boolTow = db.executeUpdate(sqlTow, paramsTow);
			
			if(boolTow) {
				
				json.put("code", 200);
				
				json.put("message", "添加购物车成功");
				
				response.getWriter().print(json.toString());
				
			}else {
				
				json.put("code", 401);
				
				json.put("message", "添加购物车失败");
				
				response.getWriter().print(json.toString());
				
			}
			
			
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
	
	
	//随机生成20位的订单编号
	
	public static String getRandomName(int len) {
		String val = "";
		Random random = new Random();

		// 参数length，表示生成几位随机数
		for (int i = 0; i < len; i++) {

			String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
			// 输出字母还是数字
			if ("char".equalsIgnoreCase(charOrNum)) {
				// 输出是大写字母还是小写字母
				int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
				val += (char) (random.nextInt(26) + temp);
			} else if ("num".equalsIgnoreCase(charOrNum)) {
				val += String.valueOf(random.nextInt(10));
			}
		}
		return val;

	}

}
