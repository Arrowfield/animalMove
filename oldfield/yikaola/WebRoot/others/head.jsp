<!-- �ļ�����1 -->
<%@page   
	   language="java" 
	   contentType="text/html;charset=GBK"  
	   import="java.sql.*"
%>
<% 
	String username = (String)session.getAttribute("username");
	if(username == null){
		username = "_�͹�_";
	} 
%>
<!-- �ļ�����2 -->
<!doctype html>
<html>
	<meta charset='utf-8'>
	<head>
		<title>��ʳ�ݲ˵�</title>
		<style>
			div a{
				text-decoration:none;
				color:gray;
				font-size:1.5rem;
			}
			div{
				text-align:center;
			}
		</style>
		<script>
			//alert("��ӭ<%=username%>��ʳ��");
		</script>
	</head>
	<body>
	<h3>��ӭ<%=username%>������ʳ��!</h3>
		<div>
			<a href="my_fruit.jsp">  ˮ����               </a>
			<a href="my_drink.jsp">  ��Ʒ��               </a>
			<a href="my_life.jsp">  ������Ʒ��          </a>
			<a href="cart2.jsp"> �鿴���ﳵ          </a>
			<a href="my_logout.jsp"> �˳���¼           </a>
		</div>
	</body>
</html>