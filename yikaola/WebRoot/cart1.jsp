<%@page 
		language="java" 
		contentType="text/html;charset=GBK"  
		import="java.sql.*"
%>
<%@include 
		 file="head.jsp"
%>
<% 
   request.setCharacterEncoding("GBK"); 
   //��session�л�ȡ��ֵ 
   String        id  = (String)session.getAttribute("id");//��������ֵ ͳһ��תΪ�ַ���
   String goodsname  = (String)session.getAttribute("goodsname");
   float  price      = (Float)session.getAttribute("price");
   //float  price    = 3;
   //�ӱ��ύ���л�ȡ��ֵ
   String number     = request.getParameter("number");
   String tel        = request.getParameter("tel");
   //ͨ�������������������ֵ 
   float   sum       = price*Float.parseFloat(number);
   boolean isValid   = false;
   //�������ݿ�
%>
<script>console.log(<%=price%>)</script>
<%
   Class.forName("com.mysql.jdbc.Driver");
   String url  = "jdbc:mysql://localhost:3306/d_easyBuy";
   String user = "root";
   String pwd  = "";   
   Connection conn = DriverManager.getConnection(url,user,pwd); 
   String sql = "INSERT INTO t_khdgb VALUES(null,?,?,?,?,?,?)";
   PreparedStatement pstmt = conn.prepareStatement(sql);//ִ��sql���
   //�����滻�����ռλ��
   pstmt.setInt(1 , Integer.parseInt(id));//Ϊ�գ� ��ʾ��һ��ռλ�� �Դ�����
   pstmt.setString(2 ,tel); 
   pstmt.setString(3 , goodsname);
   pstmt.setString(4 , number);
   pstmt.setFloat( 5 , price);
   pstmt.setFloat( 6 , sum);
   //���ز������ݿ⼯��
   int result = pstmt.executeUpdate();
   //�Բ�����������ж� 
   if(result == 1){
      isValid = true; 
   }
   if(isValid == true ){ 
   	  out.println("����ɹ�,2������<a href=\"cart2.jsp\">������Ϣ��ʾϵͳ</a>!</h3>"); 
   	  response.setHeader("Refresh","2;url=cart2.jsp");
   } 
   if(isValid == false){
   	  out.println("����ʧ��,δ��ɸ���,2��󷵻�<a href=\"head.jsp\">��ʳ��</a>!</h3>");
  	  response.setHeader("Refresh","2;url=login.html");
   } 	  
   pstmt.close();
   conn.close();
%>
<html>
	<head>
		<title>���빺�ﳵҳ��</title>
	</head>
	<body> 
	</body>
</html>