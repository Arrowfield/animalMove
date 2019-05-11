package org.field.example;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

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
		
		/*
		
		String str = System.getProperty("user.dir");
		
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
		
		InputStream stream = request.getInputStream();
		
		FileOutputStream fos = new FileOutputStream(imagePath);
		
        byte[] bbuf = new byte[32];
        
        int hasRead = 0;
        
        while ((hasRead = stream.read(bbuf)) > 0) {
        	
            fos.write(bbuf, 0, hasRead);
            
        }
        
        fos.close();
        
        stream.close();*/
		
		
		//获取二进制流
		
		try {
			
			JSONObject json = new JSONObject();
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			String uploadPath = this.getServletContext().getRealPath("/upload");
			
			System.out.print(uploadPath);
			
			File file = new File(uploadPath);
			
			if(!file.exists() && !file.isDirectory()) {
				try {
					
					file.mkdir();
					
				} catch (Exception e) {
					
					e.printStackTrace();
					
				}
				
			}
			
			FileItemIterator fii = upload.getItemIterator(request);
			
			while(fii.hasNext()){
				
				FileItemStream fis = fii.next();
				
				if(fis.isFormField()) {
					
					json.put("code", "301");
					
					json.put("message", "请输入正确的信息");
					
					response.getWriter().print(json.toString());
					
				}else {
					
					String path = fis.getName();
					
					String filename = path.substring(path.lastIndexOf("\\") + 1);
					
					BufferedInputStream bis = new BufferedInputStream(fis.openStream());
					
					BufferedOutputStream bos = new BufferedOutputStream(
							new FileOutputStream(new File(uploadPath + "\\" + filename)));
					
					Streams.copy(bis, bos, true);
					
					
					
				}
			}
			
		} catch (FileUploadException e) {
			
			e.printStackTrace();
		}
		
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