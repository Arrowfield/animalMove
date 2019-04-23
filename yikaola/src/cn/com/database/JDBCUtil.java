package cn.com.database;
import java.sql.*;
import java.util.*;
/*封装数据库连接类*/
@SuppressWarnings("unused")
public class JDBCUtil {
    /*声明连接数据库的参数*/
    private  String driver=null;      /*驱动*/
    private  String url=null;         /*路径*/
    private  String username=null;    /*用户*/
    private  String password=null;    /*密码*/
    
    /*创建操作数据库的对象*/
	private CallableStatement callableStatment=null;
    private Connection conn=null;
    private PreparedStatement pst=null;     
    private ResultSet rst=null;            /*结果集*/
    
    /*构造函数*/
    public JDBCUtil(String driver,String url,String username,String password){
        this.driver = driver;
        this.url = url;
        this.username = username;
        this.password = password;
    }
    
    /*创建连接数据库的实例方法*/
    public Connection getConnection(){
        try{
            //加载数据库的驱动
            try{
                    Class.forName(driver);
            }catch(ClassNotFoundException e){
                //驱动加载异常捕获
            	System.out.println("驱动加载失败");
            }
            //建立连接
            conn = (Connection) DriverManager.getConnection(url,username,password);
        }catch(SQLException e){
            //连接数据失败异常捕获
        	System.out.println(e.getMessage());
        }
        /*返回操作数据库对象*/
        return conn;
    }

    /*
        创建执行SQL语句的实例方法 返回值：影响的行数
        @param   sql
        @param   params
        @return  affectedLine
        目的：仅仅可以实现对数据的增、删、改（不可以实现查找功能）
    */
    public int executeUpdate(String sql,Object[] params){
        int affectedLine=0;
        try{
            //获得连接
            conn = this.getConnection();
            //调用SQL
            pst = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(sql);
            //处理参数[将参数保存到对象中]
            if(params != null){
                for(int i = 0; i<params.length; i++){
                    pst.setObject(i+1,params[i]);
                }
            }
            //执行SQL语句成功
            affectedLine = pst.executeUpdate();
        }catch(SQLException e){
        	System.out.println(e.getMessage());
        }finally{
            //释放资源        	        	
        }
        return affectedLine;
    } 
}
//编写实例方法实现对数据的查找