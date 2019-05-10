package org.field.example;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserAvatar
 */
public class UserAvatar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAvatar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*将用户的图片存储到本地，并返回路径*/
		
		
		String str = System.getProperty("user.dir");
		
		File file = new File(str + "/image/");
		
		if(!file.exists() && !file.isDirectory()) {
			try {
				
				file.mkdir();
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
		}
		
		//获取二进制流
		
		InputStream stream = request.getInputStream();
		
		//System.out.print(stream);
		
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String strCurrentTime = df.format(new Date());
		
		String imagePath =  str + "/image/" + strCurrentTime + ".png";
		
		FileOutputStream fos = new FileOutputStream(imagePath);
		
        byte[] bbuf = new byte[32];
        
        int hasRead = 0;
        
        while ((hasRead = stream.read(bbuf)) > 0) {
        	
            fos.write(bbuf, 0, hasRead);
            
        }
        
        fos.close();
        
        stream.close();
		
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
