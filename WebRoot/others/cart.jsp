<%@page language="java" contentType="text/html;charset=GBK"
	import="java.sql.*" import="java.util.*"%>
<%@include file="head.jsp"%>
<%
	request.setCharacterEncoding("GBK");//������Ϣ���뷽ʽ
	String id = request.getParameter("id");//��ȡ��Ʒ��ID ��������ֵͳͳ���Զ�ת��Ϊ�ַ���
	String name = request.getParameter("name");//�����Ʒ������
%>
<%
	/*
		�û���ˮ����ѡȡ��Ʒ����---��ˮ����t_fruit�е�fid=4
		----����t_spb����������----��������4
	 */
%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/d_easyBuy", "root", "");
	String sql = " SELECT * FROM t_spb WHERE sname = ? ";
	PreparedStatement stmt = con.prepareStatement(sql);
	//�滻ռλ����ֵ�Ǵ�������
	stmt.setString(1, name); //�滻ռλ��
	ResultSet rs = stmt.executeQuery();
	while (rs.next()) {
%>
<%
	//������html�ļ�
%>
<html>
<head>
<title>���ﳵ</title>
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
		�װ���<%=username%>����������Ʒ��Ϣ����
	</h2>
	<form name="form_1" action="cart1.jsp" method="post">
		<table>
			<tr>
				<th>��Ʒ���</th>
				<td><%=rs.getInt("sid")%></td>
			</tr>
			<tr>
				<th>��Ʒ����</th>
				<td><%=rs.getString("sname")%></td>
			</tr>
			<tr>
				<th>��Ʒ�۸�</th>
				<td><%=rs.getFloat("sprice")%></td>
			</tr>
			<tr>
				<th>���������Ķ�������</th>
				<td><input type="text" name="number"></td>
			</tr>
			<tr>
				<th>���������ĵ绰����</th>
				<td><input type="text" name="tel"></td>
			</tr>
			<tr>
				<th>ȷ�ϸ���</th>
				<td><input type="submit" name="����" value="����"></td>
			</tr>
		</table>
	</form>
</body>
</html>
<!-- ���� �ر����ݿ���� -->
<%
	//����Ҫ�����ݴ洢����
		float price = rs.getFloat("sprice");//���ݿ���ʲô���;͵���ʲô������ȡ �����ȡ������Ϊ��ֵ
		//�����ݿ��е����ݱ�����session��           
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