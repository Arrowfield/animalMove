<!-- ͷ�ļ������� -->
<%@page   
	   language="java" 
	   contentType="text/html;charset=GBK"  
	   import="java.sql.*"
%>
<!-- HTML�ļ���ʼ -->
<html>
	<head>
		<title>�˳���ʳ��ϵͳ</title>
	</head>
<body>
	<p></p>
</body>
</html>
<!-- JAVA�ļ���ʼ -->
<% 
  session.invalidate();
  out.println("<h3>�����˳� 5��󷵻�<a href='../static/watch_login.html'>��¼ҳ��</a>!</h3>");
  response.setHeader("Refresh","5;url=../static/watch_login.html");
%>