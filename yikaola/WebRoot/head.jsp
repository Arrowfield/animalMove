<!-- 文件部分1 -->
<%@page   
	   language="java" 
	   contentType="text/html;charset=GBK"  
	   import="java.sql.*"
%>
<% 
	String username = (String)session.getAttribute("username");
	if(username == null){
		username = "_客官_";
	} 
%>
<!-- 文件部分2 -->
<!doctype html>
<html>
	<meta charset='utf-8'>
	<head>
		<title>零食屋菜单</title>
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
			//alert("欢迎<%=username%>零食屋");
		</script>
	</head>
	<body>
	<h3>欢迎<%=username%>来到零食屋!</h3>
		<div>
			<a href="my_fruit.jsp">  水果区               </a>
			<a href="my_drink.jsp">  饮品区               </a>
			<a href="my_life.jsp">  生活用品区          </a>
			<a href="cart2.jsp"> 查看购物车          </a>
			<a href="my_logout.jsp"> 退出登录           </a>
		</div>
	</body>
</html>