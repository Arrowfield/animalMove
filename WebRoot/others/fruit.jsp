<!-- 设置头信息 -->
<%@page language="java" contentType="text/html;charset=GBK"
	import="java.sql.*"%>
<!-- 引入外部文件 -->
<%@include file="head.jsp"%><!-- 引入其他外部资源文件 -->
<%
	//定义连接数据的参数
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/d_easyBuy";
	String user = "root";
	String pwd = "";
%>
<%
	//标准数据库查询语句
	Class.forName(driver);
	Connection con = DriverManager.getConnection(url, user, pwd);
	String sql = "SELECT * FROM t_fruit";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
%>
<!-- 对代码格式 内容的优化 -->
<html>
<head>
<title>欢迎来到水果店</title>
<meta charset="utf-8">
<style>
.hello {
	text-align: center;
	width: 50%;
	border: 1px solid gray;
}

* {
	text-align: center;
	color: gray;
	text-decoration: none;
}

table {
	margin: 2rem auto 0;
	width: 50%;
}

table th {
	border: 1px solid gray;
}

tr td {
	border: 1px solid gray;
}

table tr td a {
	font-size: 0.9rem;
}
</style>
</head>
<body>

	<form method="post" action="cart.jsp">
		<table class="hello">
			<tr>
				<th>商品编号</th>
				<th>商品名称</th>
				<th>商品单价</th>
				<th>商品购买</th>
			</tr>
			<%
				while (rs.next()) {
					int id = rs.getInt(1);//获取到的值数id
					String name = rs.getString(2);//获取的值是商品名称
			%>
			<tr>
				<td><%=rs.getInt("fid")%></td>
				<td><%=rs.getString("fname")%></td>
				<td><%=rs.getFloat("fprice")%></td>
				<td><a href="cart.jsp?id=<%=id%>&name=<%=name%>"> 加入购物车 </a></td>
			</tr>
			<%
				}
			%>
		</table>
	</form>

</body>
</html>
<!-- 关闭数据库操作对象 -->
<%
	rs.close();
	stmt.close();
	con.close();
%>
