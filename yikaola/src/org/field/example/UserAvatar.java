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

import org.apache.commons.fileupload.disk.DiskFileItemFactory;

import net.sf.json.JSONObject;

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
		
		
		/*将用户的图片存储到本地，并返回路径*/
		
		//导入两个jar包
		
		JSONObject json = new JSONObject();
		
		String str = System.getProperty("user.dir");
		
		System.out.print(1);
		
		System.out.print(str);
		
		File file = new File(str + "/image/");
		
		if(!file.exists() && !file.isDirectory()) {
			try {
				
				file.mkdir();
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
		}
		
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String strCurrentTime = df.format(new Date());
		
		String imagePath =  str + "/image/" + strCurrentTime + ".png";
		
		
		//获取二进制流
		
		//DiskFileItemFactory factory = new DiskFileItemFactory();
		
		String realPath = getServletContext().getRealPath("/");
		
		System.out.print(realPath);
		
		
		InputStream stream = request.getInputStream();
		
		
		FileOutputStream fos = new FileOutputStream(imagePath);
		
        byte[] bbuf = new byte[32];
        
        int hasRead = 0;
        
        while ((hasRead = stream.read(bbuf)) > 0) {
        	
            fos.write(bbuf, 0, hasRead);
            
        }
        
        fos.close();
        
        stream.close();
		
		json.put("code", 200);
		
		response.getWriter().print(json.toString());
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

/*
 * 问题：
 * 
 * 修改servlet没有成功 
 * 
 * */
