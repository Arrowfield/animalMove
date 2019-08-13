<%@page   
	   language="java" 
	   contentType="text/html;charset=GBK"  
	   import="java.sql.*"
%>
<%@include 
	   file="head.jsp" 
%>
<%  
    request.setCharacterEncoding("GBK");
    //表单提交中获取的数据
    String tel=request.getParameter("tel"); 
    String id=request.getParameter("id");
    String number=request.getParameter("number"); 
    String price=request.getParameter("price");
    //从session中获取的数据
    //String goodsname=(String)session.getAttribute("goodsname");
    //变量的定义
    String driver = "com.mysql.jdbc.Driver";
    String url    = "jdbc:mysql://localhost:3306/d_easyBuy";
    String user   = "root";
    String pwd    = "";
    PreparedStatement pre = null;
    boolean isValid = false;  
    float  sum = Float.parseFloat(price)*Float.parseFloat(number);//重新计算价格
    //操作数据库将数据导入数据库中
    Class.forName(driver);  
    Connection dbConn = DriverManager.getConnection(url,user,pwd); 
    String sql = "UPDATE  t_khdgb SET number=?,sum=? where tel=? and sid=? ";
    PreparedStatement pstmt = dbConn.prepareStatement(sql);
  	//替换上面的占位符
    pstmt.setString(1 , number);
    pstmt.setFloat (2 , sum);
    pstmt.setString(3 , tel);
    pstmt.setString(4 , id);
    //返回结果集 
    int result = pstmt.executeUpdate(); 
    //对返回的结果集进行判断 
	if(result == 1){
      	isValid = true; 
   	} 
	if(isValid == true){   
   		out.println("修改成功 2秒后进入<a href='./cart2.jsp'>订购信息显示系统</a>!</h3>"); 
   		response.setHeader("Refresh","2;url=cart2.jsp");
   	}  
	if(isValid == false){   
  		out.println("修改失败 2秒后返回<a href='./my_head.jsp'>零食屋</a>!</h3>");
  		response.setHeader("Refresh","2;url=./my_head.html");
  	}
  	//关闭对数据库是操作
  	pstmt .close();
   	dbConn.close();  
 %>
<html>
	<head>
		<title>欢迎来到购物车修改界面</title>
	</head>
	<body>
	</body>
</html>