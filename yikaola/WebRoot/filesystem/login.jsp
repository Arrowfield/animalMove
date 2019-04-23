<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="./static/css/bootstrap.css">
  </head>
  
  <body>
    <div class="container-fluid p-0">
    	<div class="card m-auto w-75">
    		<div class="card-header"><span>登录测试</span></div>
    		<div class="card-body">
	    		<form method="post" action="check.jsp">
	    			<div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text">用户</span>
					    </div>
					    <input type="text" class="form-control" placeholder="Username" id="usr" name="username">
				  	</div>
				  	
				  	<div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text">密码</span>
					    </div>
					    <input type="password" class="form-control" placeholder="Upwd" id="usr" name="username">
				  	</div>
				  	<div class="text-center">
				  		<button class="btn btn-primary">登录</button>
				  		<button class="btn btn-info">注册</button>
				  	</div>
				  </form>
    		</div>
    		<div class="card-footer"></div>
    	</div>
    </div>
  </body>
</html>
