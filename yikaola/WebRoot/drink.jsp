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
		<title>��ӭ����ˮ����</title>
		<link rel="stylesheet" href='../static/css/my_css.css'>
	</head>
	<body>
		<form method="post" action="cart.jsp">
		<table>
			<tr>
				<th>��Ʒ���</th>
				<th>��Ʒ����</th>
				<th>��Ʒ����</th>
				<th>��Ʒ��</th>
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
    			<td><a href="cart.jsp?id=<%=id%>&name=<%=name%>">���빺�ﳵ</a></td>
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