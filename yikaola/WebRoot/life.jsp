<%@page language="java" contentType="text/html;charset=GBK"
	import="java.sql.*" import="cn.com.database.JDBCUtil"%>
<%@include file="head.jsp"%>
<%
	/*定义连接数据库的变量*/
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/d_easyBuy";
	String user = "root";
	String pwd = "";
%>
<%
	Class.forName(driver);
	Connection con = DriverManager.getConnection(url, user, pwd);
	String sql = "SELECT * FROM t_life";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);//执行sql语句 并返回结果集
	/*
		问题:通过对操作数据库与的封装进行对代码的简化
		         （1）查找数据的封装
	 */
%>
<html>
<head>
<title>欢迎来到生活用品店</title>
<link rel="stylesheet" href='../static/css/my_css.css'>
</head>
<body>
	<form method="post" action="cart.jsp">
		<table class="logo_hello">
			<tr>
				<th>商品编号</th>
				<th>商品名称</th>
				<th>商品单价</th>
				<th>商品求购</th>
			</tr>
			<%
				while (rs.next()) {
					int id = rs.getInt(1);
					String name = rs.getString(2);
			%>
			<tr align="center">
				<td><%=rs.getInt("lid")%></td>
				<td><%=rs.getString("lname")%></td>
				<td><%=rs.getFloat("lprice")%></td>
				<td><a href="cart.jsp?id=<%=id%>&name=<%=name%>">加入购物车</a></td>
			</tr>
			<!--  
  			<tr>
  				<td colspan='4'>
  					<a href="javascript:console.log('<%=rs%>')">查看数据库结果集</a>
  				</td>
  			</tr>
  			-->
			<%
				}
			%>
		</table>
	</form>
</body>
</html>
<%
	rs.close();
	stmt.close();
	con.close();
%>