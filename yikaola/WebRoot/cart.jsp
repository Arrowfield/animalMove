<%@page language="java" contentType="text/html;charset=GBK"
	import="java.sql.*" import="java.util.*"%>
<%@include file="head.jsp"%>
<%
	request.setCharacterEncoding("GBK");//设置信息编码方式
	String id = request.getParameter("id");//获取商品的ID 传过来的值统统会自动转化为字符串
	String name = request.getParameter("name");//获得商品的名称
%>
<%
	/*
		用户在水果区选取商品：传---》水果在t_fruit中的fid=4
		----》在t_spb中有许多外键----》都等于4
	 */
%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/d_easyBuy", "root", "");
	String sql = " SELECT * FROM t_spb WHERE sname = ? ";
	PreparedStatement stmt = con.prepareStatement(sql);
	//替换占位符的值是传过来的
	stmt.setString(1, name); //替换占位符
	ResultSet rs = stmt.executeQuery();
	while (rs.next()) {
%>
<%
	//以下是html文件
%>
<html>
<head>
<title>购物车</title>
<style>
h2 {
	text-align: center;
}

table {
	text-align: center;
	border: 1px solid gray;
	width: 50%;
	margin: 1rem auto;
}

td {
	border: 1px solid gray;
}
</style>
</head>
<body>
	<h2>
		亲爱的<%=username%>您订购的商品信息如下
	</h2>
	<form name="form_1" action="cart1.jsp" method="post">
		<table>
			<tr>
				<th>商品编号</th>
				<td><%=rs.getInt("sid")%></td>
			</tr>
			<tr>
				<th>商品名称</th>
				<td><%=rs.getString("sname")%></td>
			</tr>
			<tr>
				<th>商品价格</th>
				<td><%=rs.getFloat("sprice")%></td>
			</tr>
			<tr>
				<th>请输入您的定购数量</th>
				<td><input type="text" name="number"></td>
			</tr>
			<tr>
				<th>请输入您的电话号码</th>
				<td><input type="text" name="tel"></td>
			</tr>
			<tr>
				<th>确认付款</th>
				<td><input type="submit" name="付款" value="付款"></td>
			</tr>
		</table>
	</form>
</body>
</html>
<!-- 结束 关闭数据库操作 -->
<%
	//将需要的数据存储起来
		float price = rs.getFloat("sprice");//数据库是什么类型就得用什么方法获取 否则获取的数据为空值
		//将数据库中的数据保存在session中           
		session.setAttribute("id", id);
		session.setAttribute("goodsname", name);
		session.setAttribute("price", price);
%>
<script>
	//alert(
<%=price%>
</script>
<%
	}
	rs.close();
	stmt.close();
	con.close();
%>