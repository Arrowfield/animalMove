<%@page 
	   language="java" 
	   contentType="text/html;charset=GBK"  
	   import="java.sql.*"
	   import="java.util.*"
%>
<%@include 
	   file="head.jsp" 
%>
<% 
   request.setCharacterEncoding("GBK");//����ͷ��Ϣ
   String  tel = request.getParameter("tel");
   String  id  = request.getParameter("id");
   //�������ݿ�����
   String driver = "com.mysql.jdbc.Driver";
   String url    = "jdbc:mysql://localhost:3306/d_easyBuy";
   String user   = "root";
   String pwd    = "";
   boolean isValid=false;
   //�������ݿ�
   Class.forName(driver);  
   Connection con =  DriverManager.getConnection(url,user,pwd); 
   String sql     = "DELETE FROM t_khdgb WHERE tel = ? AND sid = ?";
   PreparedStatement stmt=con.prepareStatement(sql);//����ʹ���������������ݿ�
   //�滻ռλ��	
   stmt.setString(1,tel);
   stmt.setString(2,id );
   //���ؽ����
   int rs = stmt.executeUpdate();
%>
<script>
	var vail=true;
	if(vail == <%=rs%>){
		alert('ɾ���ɹ�');
	}else{
		alert('ɾ��ʧ��');
	}
</script>   
<% 
/*
   if(rs==1){
      isValid = true; 
   }
   if(isValid == true){
   		out.println("ɾ���ɹ�,2������<a href=\"cart2.jsp\">������Ϣ��ʾϵͳ</a>!</h3>"); 
   		response.setHeader("Refresh","2;url=cart2.jsp");
   }
   if(isValid == false){
		out.println("ɾ��ʧ��,2��󷵻�<a href=\"head.jsp\">��ʳ��</a>!</h3>");
		response.setHeader("Refresh","2;url=head.jsp"); 
	}
*/ 
%>
<% 
   stmt.close();
    con.close();
%>
<html>
	<head>
		<title>���ﳵ</title>
	</head>
	<body> 
    </body>
</html>