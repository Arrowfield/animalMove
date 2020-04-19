<%@page 
	   language="java" 
	   contentType="text/html;charset=GBK"  
	   import="java.sql.*"
	   import="java.util.*"
%>
<%@include 
	   file="head.jsp" 
%>
<% 
   request.setCharacterEncoding("GBK");//设置头信息
   String  tel = request.getParameter("tel");
   String  id  = request.getParameter("id");
   //定义数据库属性
   String driver = "com.mysql.jdbc.Driver";
   String url    = "jdbc:mysql://localhost:3306/d_easyBuy";
   String user   = "root";
   String pwd    = "";
   boolean isValid=false;
   //连接数据库
   Class.forName(driver);  
   Connection con =  DriverManager.getConnection(url,user,pwd); 
   String sql     = "DELETE FROM t_khdgb WHERE tel = ? AND sid = ?";
   PreparedStatement stmt=con.prepareStatement(sql);//优先使用子类对象操作数据库
   //替换占位符	
   stmt.setString(1,tel);
   stmt.setString(2,id );
   //返回结果集
   int rs = stmt.executeUpdate();
%>
<script>
	var vail=true;
	if(vail == <%=rs%>){
		alert('删除成功');
	}else{
		alert('删除失败');
	}
</script>   
<% 
/*
   if(rs==1){
      isValid = true; 
   }
   if(isValid == true){
   		out.println("删除成功,2秒后进入<a href=\"cart2.jsp\">订购信息显示系统</a>!</h3>"); 
   		response.setHeader("Refresh","2;url=cart2.jsp");
   }
   if(isValid == false){
		out.println("删除失败,2秒后返回<a href=\"head.jsp\">零食屋</a>!</h3>");
		response.setHeader("Refresh","2;url=head.jsp"); 
	}
*/ 
%>
<% 
   stmt.close();
    con.close();
%>
<html>
	<head>
		<title>购物车</title>
	</head>
	<body> 
    </body>
</html>