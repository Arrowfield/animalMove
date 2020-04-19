<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
  String path = request.getContextPath();
  String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--可以执行JAVA JS CSS代码的文档类型-->
<!--标准JSP模板文件-->
<!Doctype html>
<html>
	<head>
		<base href="<%=basepath %>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>我的模板</title>
		<style>
		</style>
	</head>
	<body>
		<p>我的模板</p>
	</body>
	<script>
	</script>
</html>