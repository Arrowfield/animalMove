<%@page   
	   language="java" 
	   contentType="text/html;charset=GBK"  
	   import="java.sql.*"
%>
<%@include 
	   file="head.jsp" 
%>
<% 
   //定义变量
   String driver = "com.mysql.jdbc.Driver";
   String url 	 = "jdbc:mysql://localhost:3306/d_easyBuy";
   String user   = "root";
   String pwd    = "";
   String tel    = request.getParameter("tel");//从上个表单中只提取手机号码 
   PreparedStatement pre = null;
   //连接数据库
   Class.forName(driver);  
   Connection con = DriverManager.getConnection(url,user,pwd);
   //将代码相同的部分提取出来？？？？ 
   String     sql = "SELECT * FROM t_khdgb WHERE tel = ?";
   //执行SQL语句
   pre = con.prepareStatement(sql); 
   pre.setString(1, tel);//第一个占位符表示用户的电话号码 
   ResultSet rs = pre.executeQuery();//返回结果集
   /*
   		返回是结果集的数据形式为：com.mysql.jdbc.JDBC4ResultSet@2c5a1e6b
   		代码分离：高聚合 低耦合
   */
%>

<script>
	console.log('<%=rs%>');
</script>

<html>
	<head>
		<title>欢迎来到购物车清单显示系统</title>
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
		<h2>欢迎<%=username %>来到购物车清单显示界面</h2>
		<form action="cart2.jsp" method="post">
		<table>
			<tr>
				<td>请输入您的电话号码：
					<input type="text" name="tel">
				</td>
				<td>
					<input type="submit" value="查找">
				</td>
			</tr>
		</table>
		</form>
		<table>
			<tr>
				<th>商品编号</th>
				<th>商品名称</th>
				<th>商品单价</th>
				<th>商品数量</th>
				<th>商品总价</th>
				<th>商品管理</th>
			</tr>
<%
	while(rs.next()){
		tel=rs.getString(3);//获取数据的表中的第三个数据		
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
	String id=rs.getString("sid");//从数据库中过去属性名为"kid"的字段
%>
			   <td>
			   		<a href="edit.jsp?id=<%=id%>&tel=<%=tel%>">修改</a>
			        <a href="del.jsp?id=<%=id%>&tel=<%=tel%>"> 删除</a>
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