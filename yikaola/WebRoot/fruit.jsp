<!-- ����ͷ��Ϣ -->
<%@page language="java" contentType="text/html;charset=GBK"
	import="java.sql.*"%>
<!-- �����ⲿ�ļ� -->
<%@include file="head.jsp"%><!-- ���������ⲿ��Դ�ļ� -->
<%
	//�����������ݵĲ���
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/d_easyBuy";
	String user = "root";
	String pwd = "";
%>
<%
	//��׼���ݿ��ѯ���
	Class.forName(driver);
	Connection con = DriverManager.getConnection(url, user, pwd);
	String sql = "SELECT * FROM t_fruit";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
%>
<!-- �Դ����ʽ ���ݵ��Ż� -->
<html>
<head>
<title>��ӭ����ˮ����</title>
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
				<th>��Ʒ���</th>
				<th>��Ʒ����</th>
				<th>��Ʒ����</th>
				<th>��Ʒ����</th>
			</tr>
			<%
				while (rs.next()) {
					int id = rs.getInt(1);//��ȡ����ֵ��id
					String name = rs.getString(2);//��ȡ��ֵ����Ʒ����
			%>
			<tr>
				<td><%=rs.getInt("fid")%></td>
				<td><%=rs.getString("fname")%></td>
				<td><%=rs.getFloat("fprice")%></td>
				<td><a href="cart.jsp?id=<%=id%>&name=<%=name%>"> ���빺�ﳵ </a></td>
			</tr>
			<%
				}
			%>
		</table>
	</form>

</body>
</html>
<!-- �ر����ݿ�������� -->
<%
	rs.close();
	stmt.close();
	con.close();
%>
