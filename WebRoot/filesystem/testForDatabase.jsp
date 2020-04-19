<%@  page language="java" contentType="text/html;charset=utf-8"
	import="cn.com.database.JDBCUtil"%>
<%
	String path = request.getContextPath();
	String basepath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!--可以执行JAVA JS CSS代码的文档类型-->
<!--标准JSP模板文件-->
<%
	//执行java代码 检测数据库是否连接成功
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/xz";
	String username = "root";
	String password = "";
	JDBCUtil jdbcUtil = new JDBCUtil(driver, url, username, password);
	String sql = "DELETE  FROM xz_user WHERE uid=3";
	int count = jdbcUtil.executeUpdate(sql, null);
	String msg = "通过连接数据库您删除的用户为" + count;
%>
<!Doctype html>
<html>
<head>
<base href="<%=basepath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的模板</title>
<style>
body {
	background: pink;
}

p {
	text-align: center;
	background-color: pink;
	color: white;
	font-size: 2rem;
	padding: 1rem 1rem;
}

input {
	height: 36px;
	/*padding-bottom:1rem;*/
	vertical-align: middle;
}
</style>
</head>
<body>
	<div>
		<p id='app'>
			<%
				out.println("通过连接数据库您删除的用户为" + count);
			%>
		</p>
		<p>
			请输入您要删除用户的编号： <input type='text'>
			<%
				//问题：如何获取input中的输入值
			%>
		</p>
	</div>
	<script>
		var p = app;
		p.onclick = function() {
			alert("teng");
		};
	</script>
</body>
</html>