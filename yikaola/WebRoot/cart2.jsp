<%@page   
	   language="java" 
	   contentType="text/html;charset=GBK"  
	   import="java.sql.*"
%>
<%@include 
	   file="head.jsp" 
%>
<% 
   //�������
   String driver = "com.mysql.jdbc.Driver";
   String url 	 = "jdbc:mysql://localhost:3306/d_easyBuy";
   String user   = "root";
   String pwd    = "";
   String tel    = request.getParameter("tel");//���ϸ�����ֻ��ȡ�ֻ����� 
   PreparedStatement pre = null;
   //�������ݿ�
   Class.forName(driver);  
   Connection con = DriverManager.getConnection(url,user,pwd);
   //��������ͬ�Ĳ�����ȡ������������ 
   String     sql = "SELECT * FROM t_khdgb WHERE tel = ?";
   //ִ��SQL���
   pre = con.prepareStatement(sql); 
   pre.setString(1, tel);//��һ��ռλ����ʾ�û��ĵ绰���� 
   ResultSet rs = pre.executeQuery();//���ؽ����
   /*
   		�����ǽ������������ʽΪ��com.mysql.jdbc.JDBC4ResultSet@2c5a1e6b
   		������룺�߾ۺ� �����
   */
%>

<script>
	console.log('<%=rs%>');
</script>

<html>
	<head>
		<title>��ӭ�������ﳵ�嵥��ʾϵͳ</title>
		<style>
			h2{
				text-align:center;
			}
			table{
				text-align:center;
				border:1px solid gray;
				margin:1rem auto;
			}
			td{
				border:1px solid gray;
			}
			table tr td a:nth-child(2){
				/*font-size:1.2rem;*/
				color:pink;
			}
		</style>
	</head>
	<body>
		<h2>��ӭ<%=username %>�������ﳵ�嵥��ʾ����</h2>
		<form action="cart2.jsp" method="post">
		<table>
			<tr>
				<td>���������ĵ绰���룺
					<input type="text" name="tel">
				</td>
				<td>
					<input type="submit" value="����">
				</td>
			</tr>
		</table>
		</form>
		<table>
			<tr>
				<th>��Ʒ���</th>
				<th>��Ʒ����</th>
				<th>��Ʒ����</th>
				<th>��Ʒ����</th>
				<th>��Ʒ�ܼ�</th>
				<th>��Ʒ����</th>
			</tr>
<%
	while(rs.next()){
		tel=rs.getString(3);//��ȡ���ݵı��еĵ���������		
%>
			
			<tr>
				<td>
					<%=rs.getInt("sid")%>
				</td>
				<td>
					<%=rs.getString("goodname")%>
				</td>
				<td>
					<%=rs.getString("price")%>
				</td>
				<td>
					<%=rs.getString("number")%>
				</td>
				<td>
					<%=rs.getString("sum")%>
				</td>
<%
	String id=rs.getString("sid");//�����ݿ��й�ȥ������Ϊ"kid"���ֶ�
%>
			   <td>
			   		<a href="edit.jsp?id=<%=id%>&tel=<%=tel%>">�޸�</a>
			        <a href="del.jsp?id=<%=id%>&tel=<%=tel%>"> ɾ��</a>
			   </td>
			</tr>
			<%}%>
		</table>
		<script src='./my_js/my_js.js'></script>
	</body>
</html>
<%		
	rs.close();
	pre.close();
	con.close();
%>