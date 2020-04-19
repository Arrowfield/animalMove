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
   //从session中获取的值 
   String        id  = (String)session.getAttribute("id");//传过来的值 统一会转为字符串
   String goodsname  = (String)session.getAttribute("goodsname");
   float  price      = (Float)session.getAttribute("price");
   //float  price    = 3;
   //从表单提交中中获取的值
   String number     = request.getParameter("number");
   String tel        = request.getParameter("tel");
   //通过单价与数量计算的总值 
   float   sum       = price*Float.parseFloat(number);
   boolean isValid   = false;
   //连接数据库
%>
<script>console.log(<%=price%>)</script>
<%
   Class.forName("com.mysql.jdbc.Driver");
   String url  = "jdbc:mysql://localhost:3306/d_easyBuy";
   String user = "root";
   String pwd  = "";   
   Connection conn = DriverManager.getConnection(url,user,pwd); 
   String sql = "INSERT INTO t_khdgb VALUES(null,?,?,?,?,?,?)";
   PreparedStatement pstmt = conn.prepareStatement(sql);//执行sql语句
   //依次替换上面的占位符
   pstmt.setInt(1 , Integer.parseInt(id));//为空？ 表示第一个占位符 以此类推
   pstmt.setString(2 ,tel); 
   pstmt.setString(3 , goodsname);
   pstmt.setString(4 , number);
   pstmt.setFloat( 5 , price);
   pstmt.setFloat( 6 , sum);
   //返回操作数据库集合
   int result = pstmt.executeUpdate();
   //对操作结果进行判断 
   if(result == 1){
      isValid = true; 
   }
   if(isValid == true ){ 
   	  out.println("购买成功,2秒后进入<a href=\"cart2.jsp\">订购信息显示系统</a>!</h3>"); 
   	  response.setHeader("Refresh","2;url=cart2.jsp");
   } 
   if(isValid == false){
   	  out.println("购买失败,未完成付款,2秒后返回<a href=\"head.jsp\">零食屋</a>!</h3>");
  	  response.setHeader("Refresh","2;url=login.html");
   } 	  
   pstmt.close();
   conn.close();
%>
<html>
	<head>
		<title>加入购物车页面</title>
	</head>
	<body> 
	</body>
</html>