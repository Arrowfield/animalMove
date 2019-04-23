<!-- 头文件的声明 -->
<%@page   
	   language="java" 
	   contentType="text/html;charset=GBK"  
	   import="java.sql.*"
%>
<!-- HTML文件开始 -->
<html>
	<head>
		<title>退出零食屋系统</title>
	</head>
<body>
	<p></p>
</body>
</html>
<!-- JAVA文件开始 -->
<% 
  session.invalidate();
  out.println("<h3>正在退出 5秒后返回<a href='../static/watch_login.html'>登录页面</a>!</h3>");
  response.setHeader("Refresh","5;url=../static/watch_login.html");
%>