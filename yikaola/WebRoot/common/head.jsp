<head>
	<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
    <meta charset="UTF-8">
    <%@ page import="java.util.*"%>
    <%
    	response.setContentType("text/html;charset=UTF-8");
 		request.setCharacterEncoding("UTF-8");
 		String title = request.getParameter("title");
    %>
    <script>//window.alert('<%=title%>')</script>
    <title><%=title%></title>
    <!-- css文件 -->
    <link rel="stylesheet" href="./static/css/common.css">
    <link rel="stylesheet" href="./static/css/index.css">
    <link rel="stylesheet" href="./static/css/iconfont.css">
    <link rel="stylesheet" href="./static/css/bootstrap.css">
   	<!-- js文件 -->
    <script src="./static/javascript/jquery-3.2.1.js"></script>
    <script src="./static/javascript/popper.js"></script>
    <script src="./static/javascript/bootstrap.js"></script>
</head>