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
    //���ύ�л�ȡ������
    String tel=request.getParameter("tel"); 
    String id=request.getParameter("id");
    String number=request.getParameter("number"); 
    String price=request.getParameter("price");
    //��session�л�ȡ������
    //String goodsname=(String)session.getAttribute("goodsname");
    //�����Ķ���
    String driver = "com.mysql.jdbc.Driver";
    String url    = "jdbc:mysql://localhost:3306/d_easyBuy";
    String user   = "root";
    String pwd    = "";
    PreparedStatement pre = null;
    boolean isValid = false;  
    float  sum = Float.parseFloat(price)*Float.parseFloat(number);//���¼���۸�
    //�������ݿ⽫���ݵ������ݿ���
    Class.forName(driver);  
    Connection dbConn = DriverManager.getConnection(url,user,pwd); 
    String sql = "UPDATE  t_khdgb SET number=?,sum=? where tel=? and sid=? ";
    PreparedStatement pstmt = dbConn.prepareStatement(sql);
  	//�滻�����ռλ��
    pstmt.setString(1 , number);
    pstmt.setFloat (2 , sum);
    pstmt.setString(3 , tel);
    pstmt.setString(4 , id);
    //���ؽ���� 
    int result = pstmt.executeUpdate(); 
    //�Է��صĽ���������ж� 
	if(result == 1){
      	isValid = true; 
   	} 
	if(isValid == true){   
   		out.println("�޸ĳɹ� 2������<a href='./cart2.jsp'>������Ϣ��ʾϵͳ</a>!</h3>"); 
   		response.setHeader("Refresh","2;url=cart2.jsp");
   	}  
	if(isValid == false){   
  		out.println("�޸�ʧ�� 2��󷵻�<a href='./my_head.jsp'>��ʳ��</a>!</h3>");
  		response.setHeader("Refresh","2;url=./my_head.html");
  	}
  	//�رն����ݿ��ǲ���
  	pstmt .close();
   	dbConn.close();  
 %>
<html>
	<head>
		<title>��ӭ�������ﳵ�޸Ľ���</title>
	</head>
	<body>
	</body>
</html>