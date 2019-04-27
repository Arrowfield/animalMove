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
   String id  = request.getParameter("id"); 
   String tel = request.getParameter("tel");
   //定义变量 
   String driver = "com.mysql.jdbc.Driver";
   String url    = "jdbc:mysql://localhost:3306/d_easyBuy";
   String user   = "root";
   String pwd    = "";
   PreparedStatement pre = null;
   //操作数据库
   Class.forName(driver);  
   Connection con = DriverManager.getConnection(url,user,pwd); 
   String     sql = "SELECT * FROM t_khdgb WHERE sid=? AND tel=?";
   pre = con.prepareStatement(sql); 
   //替换占位符
   pre.setString(1, id ); 
   pre.setString(2, tel);  
   ResultSet  rs = pre.executeQuery(); 
   while(rs.next()){		
%>
<% 
   String number=rs.getString("number");
   float price=rs.getFloat("price");
   String goodsname=rs.getString("goodname"); 
   session.setAttribute("goodsname",goodsname);   
%>
<!-- 将所有隐藏或者显示的信息以表单的形式提交下一个页面 在将数据存储到数据库中 --> 
<html>
	<head>
		<title>欢迎来到购物车修改界面</title>
		<style>
			body{
				/*background:pink;*/
			}
			.hello{
				text-align:center; 
				width:50%; 
				border:1px solid gray;
			}
			table{
				/*width:30%;*/
				border:1px solid gray;
				text-align:center;
				margin:1rem auto;
			}
			form{
				background:gray;
				opacity:0.5;
				width:500px;
				margin:1rem auto;
			}
		</style>
	</head>
	<body>
		<table class="hello">
            <tr>
            	<th>商品编号</th>
            	<th>商品名称</th>
            	<th>商品单价</th>
            	<th>商品数量</th>
            	<th>商品总价</th>
            </tr>
			<tr>
				<td><%=rs.getInt("sid")%>          </td>
				<td><%=rs.getString("goodname")%></td>
				<td><%=rs.getString("price")%>    </td>
				<td><%=rs.getString("number")%>   </td>
				<td><%=rs.getString("sum") %>     </td>                       
         	</tr>
       </table>
       <form method="post" name="my_form" action="./edit1.jsp">              
	   <table>   
			<tr>
				<td>
		          <input type="hidden" name="tel" value="<%=tel%>" >
		          <input type="hidden" name="id"  value="<%=id%>"  >
		        </td>	
		    </tr>
		    <tr>
		        <th>数量：</th>
		        <td>
		           <input type="text" name="number" value="<%=number%>">
		        </td>
		        <td>
		         	<input type="hidden" name="price"  value="<%=price%> ">                
		        </td>
		    </tr>
		    <%}%>	
		    <tr>
			    <td colspan="2">
			         <input type="reset"  value="重置" >
			         <input type="submit" value="修改" >
			    </td>
		     </tr>
	   </table>
	   </form>
	 </body>
</html>     
<% 	 
	rs .close();
	pre.close();
	con.close();
%>