<%@page language="java" contentType="text/html;charset=GBK"
	import="java.sql.*" import="cn.com.database.JDBCUtil"%>
<%@include file="head.jsp"%>
<%
	/*�����������ݿ�ı���*/
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
	ResultSet rs = stmt.executeQuery(sql);//ִ��sql��� �����ؽ����
	/*
		����:ͨ���Բ������ݿ���ķ�װ���жԴ���ļ�
		         ��1���������ݵķ�װ
	 */
%>
<html>
<head>
<title>��ӭ����������Ʒ��</title>
<link rel="stylesheet" href='../static/css/my_css.css'>
</head>
<body>
	<form method="post" action="cart.jsp">
		<table class="logo_hello">
			<tr>
				<th>��Ʒ���</th>
				<th>��Ʒ����</th>
				<th>��Ʒ����</th>
				<th>��Ʒ��</th>
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
				<td><a href="cart.jsp?id=<%=id%>&name=<%=name%>">���빺�ﳵ</a></td>
			</tr>
			<!--  
  			<tr>
  				<td colspan='4'>
  					<a href="javascript:console.log('<%=rs%>')">�鿴���ݿ�����</a>
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