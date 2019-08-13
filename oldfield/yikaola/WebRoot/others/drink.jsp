<%@page   
	   language="java" 
	   contentType="text/html;charset=GBK"  
	   import="java.sql.*"
%>
<%@include 
	      file="head.jsp" 
%>
<%
   Class.forName("com.mysql.jdbc.Driver");  
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/d_easyBuy","root",""); 
   String sql="SELECT * FROM t_drink";
   Statement stmt=con.createStatement();
   ResultSet rs=stmt.executeQuery(sql);
 %>
 <!doctype html>
<html>
	<head>
		<title>欢迎来到水果店</title>
		<link rel="stylesheet" href='../static/css/my_css.css'>
	</head>
	<body>
		<form method="post" action="cart.jsp">
		<table>
			<tr>
				<th>商品编号</th>
				<th>商品名称</th>
				<th>商品单价</th>
				<th>商品求购</th>
			</tr>
			<% 
				while(rs.next()){
   				int id = rs.getInt(1);
   				String name = rs.getString(2);
   			%>	
    		<tr>
    			<td><%=rs.getInt("did")%>          </td>
    			<td><%=rs.getString("dname")%></td>
    			<td><%=rs.getFloat("dprice") %>    </td>
    			<td><a href="cart.jsp?id=<%=id%>&name=<%=name%>">加入购物车</a></td>
   			</tr>
   			<%}%>
		</table>
		</form>
	</body>
</html>
<%
	rs.close();
	stmt.close();
	con.close();
%>